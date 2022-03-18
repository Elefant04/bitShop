const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);

let alreadyLoadedProducts = 10;


function loadAdditionalProductsCategory(rowcount, kategorie) {
	if(kategorie == undefined){
		kategorie = urlParams.get('category');
	}
	loadAndInsert('ajax/loadProducts.php?kategorie=' + kategorie + '&start=' + alreadyLoadedProducts + '&rowcount=' + rowcount)
	alreadyLoadedProducts += rowcount;
	
}


function createProductDiv(product){
	const productDiv = document.createElement('div');
	productDiv.classList.add('productCard');
	productDiv.innerHTML = `
	<img src="assets/products/${product.bild}" alt="${product.produktName}">
	<div class="bottomArea">
		<p>${product.preis}</p>
		<p>${product.produktName}</p>
	</div>
	`;
	return productDiv;
}

function loadAdditionalProductsSearch(rowcount, search) {
	if(search == undefined){
		search = urlParams.get('searchQuery');
	}
	loadAndInsert('ajax/loadProducts.php?searchQuery=' + search + '&start=' + alreadyLoadedProducts + '&rowcount=' + rowcount)
	alreadyLoadedProducts += rowcount;
}

function loadAndInsert(address){
	fetch(address)
	.then(function(response) {
		response.json().then(function(data) {
			const resultDiv = document.getElementById('searchResultArea');
			data.forEach(function(product) {
				resultDiv.appendChild(createProductDiv(product));
			});
		})
	})
	.catch(function(error) {
		console.log(error);
	});
}


function sleep(ms) {
	return new Promise(resolve => setTimeout(resolve, ms));
}