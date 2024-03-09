let datos = {
    labels: ['Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sábado'],
    datasets: [{
        label: '',
        data: [25, 50, 30, 45, 12, 90],
        backgroundColor: [
            '#9BD0F5',
            '#FF6384',
            '#FF9F40',
            '#9966FF',
            '#FFCD56',
            '#C9CBCF',
        ],
        borderColor: [
            'rgba(255, 99, 132, 1)',
            'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)',
            'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)',
            'rgba(54, 162, 235, 1)',
        ]
    }]
};

let opciones = {
    scales: {
        y: {
            beginAtZero: true
        }
    }
};
let ctx = document.getElementById('graficoBarras').getContext('2d');

let miGrafico = new Chart(ctx, {
    type: 'bar',
    data: datos,
    options: opciones
});

const productos = [
    { nombre: 'Arroz', descripcion: 'Arroz importado desde Africa', precio: 1.200, imagen: 'assets/products/1.webp' },
    { nombre: 'Maní de Chocolate', descripcion: 'Chocolate importado desde el eje cafetero', precio: 15.000, imagen: 'assets/products/2.webp' },
];


const productosContainer = document.getElementById('productosContainer');
productosContainer.innerHTML = productos.map(producto => `
                <div class="col-lg-3">
                    <div class="card">
                        <img src="${producto.imagen}" alt="${producto.nombre}">
                        <h3>${producto.nombre}</h3>
                        <p>${producto.descripcion}</p>
                        <p>Precio: $${producto.precio.toFixed(2)}</p>
                    </div>
                </div>`).join('');