document.addEventListener('DOMContentLoaded', () => {
    fetch('/api/dashboard-data')
        .then(res => res.json())
        .then(data => {
            if (data.error) {
                console.error("Error del backend:", data.error);
                return;
            }
            renderVentasTotales(data);
            renderGeneros(data);
            renderClasificacion(data);
            renderOcupacionSalas(data);
        })
        .catch(err => console.error("Error al cargar el dashboard:", err));
});

// Gráfica de Ventas Totales por Mes
function renderVentasTotales(data) {
    const ctx = document.getElementById('ventasTotalesChart').getContext('2d');
    new Chart(ctx, {
        type: 'line',
        data: {
            labels: data.ventas_totales.meses,
            datasets: [{
                label: 'Ingresos ($)',
                data: data.ventas_totales.valores,
                borderColor: 'rgba(75, 192, 192, 1)',
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                fill: true,
                tension: 0.4
            }]
        },
        options: {
            responsive: true
        }
    });
}
function renderGeneros(data) {
    const ctx = document.getElementById('entradasGeneroChart').getContext('2d');
    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: data.generos.labels,
            datasets: [{
                label: 'Entradas por Género',
                data: data.generos.valores,
                backgroundColor: 'rgba(153, 102, 255, 0.6)',
                borderColor: 'rgba(153, 102, 255, 1)',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true
        }
    });
}

function renderClasificacion(data) {
    const ctx = document.getElementById('clasificacionChart').getContext('2d');
    new Chart(ctx, {
        type: 'pie',
        data: {
            labels: data.clasificacion.labels,
            datasets: [{
                label: 'Clasificación',
                data: data.clasificacion.valores,
                backgroundColor: [
                    '#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF'
                ],
                borderColor: '#fff',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true
        }
    });
}

function renderOcupacionSalas(data) {
    const ctx = document.getElementById('ocupacionSalasChart').getContext('2d');
    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: data.ocupacion_salas.labels,
            datasets: [{
                label: 'Ocupación (%)',
                data: data.ocupacion_salas.valores,
                backgroundColor: 'rgba(255, 159, 64, 0.6)',
                borderColor: 'rgba(255, 159, 64, 1)',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    max: 100,
                    beginAtZero: true
                }
            }
        }
    });
}