/*:
# Ejercicio 1: gestión de un Supermercado
 
 ![Ejercicio de supermercado](supermercado.png)

 Imagina que estás desarrollando un sistema simple para gestionar un supermercado. Usa los conceptos que has aprendido (tipos de datos, arrays, sets, tuplas y diccionarios) para completar las tareas siguientes:
 
 */
/*:
 ## Paso 1: Tipos de datos

 Define las siguientes constantes y variables con el tipo adecuado:

 - **Nombre del supermercado** (string): `"Super Awesome Market"`
 - **Dirección del supermercado** (string): `"Calle Ficticia, 123"`
 - **Años en que lleva operando** (int): `10`
 - **Nivel de satisfacción promedio de los clientes** (float): `4.5`
 - **Variable booleana** llamada `isOpen`: `true` (indica si el supermercado está abierto)

 */
// Abstractions of the supermarket data
let name: String = "Super Awesome Market"
let address: String = "Calle Ficticia, 123"
let yearsOperated: Int = 10
let customerSatisfactionAverage: Float = 4.5 // This data depends of the user evaluation, could change but I set it as let
let isOpen: Bool = true // This data depends of the schedule of supermarket, could change but I set it as let
/*:
 ## Paso 2: Arrays - Gestionar inventario
 
 Crea un array que liste los siguientes productos del supermercado:

 - manzanas
 - plátanos
 - leche
 - huevos
 - pan

 Agrega al final del array:

 - caramelos

 Imprime el número total de productos en el inventario.

 */
// Abstraction of the supermarket products
var products: [String] = ["manzanas", "plátanos", "leche", "huevos", "pan"]
products.append("dulces")
print("Tenemos a la venta \(products.count) productos en el supermercado")
/*:
 ## Paso 3: Sets - Seguimiento de clientes frecuentes

 Crea un conjunto inicial con los nombres de los clientes frecuentes:

 - "alice"
 - "bob"
 - "charlie"

 Realiza las siguientes operaciones:

 1. Agrega un nuevo cliente llamado **diana**.
 2. Elimina al cliente **charlie**, ya que ha dejado de ser frecuente.
 3. Verifica si **alice** es aún cliente frecuente.

 */
// Abstraction of frequent customers
var frequentCustomers: Set<String> = ["alice", "bob", "charlie"]
frequentCustomers.insert("diana")
frequentCustomers.remove("charlie")
frequentCustomers.contains("alice")
/*:
 ## Paso 4: Tuplas - Información de ofertas

 Crea una tupla para representar una oferta semanal llamada `weeklyOffer`. Cada oferta se compone de:

 - **Nombre del producto en oferta** (string)
 - **Precio original** (float)
 - **Descuento aplicado como porcentaje** (int)

 Por ejemplo: `manzanas`, `2.99`, `20`.

 Imprime el precio descontado usando los valores de la tupla.

 */
// Abstraction of weekly offer data
let weeklyOffer = ("manzanas", 2.99, 20)
let (offerName, productPrice, productDiscount) = weeklyOffer
// Calculates the product price with discount
let productPriceWithDiscount: Double = productPrice - (productPrice * Double(productDiscount)/100)
print("Aprovecha este martes de oferta: \(offerName) en \(productPriceWithDiscount)")
/*:
 ## Paso 5: Diccionarios - Registro de ventas

 Crea un diccionario llamado `salesRecord` donde las claves sean los nombres de los productos y los valores sean las cantidades vendidas.

 Inicializa el diccionario con los valores:

 - manzanas: `50`
 - plátanos: `30`
 - leche: `20`
 - huevos: `10`

 Actualiza los datos:

 - Se vendieron `5` manzanas adicionales.
 - Se agotaron los huevos (quedan `0` en existencias).

 Repite el diccionario para imprimir el producto y su cantidad vendida.

 */
// Abstraction of products stock
var salesRecord = [
    "manzanas": 50,
    "plátanos": 30,
    "leche": 20,
    "huevos": 10
]

salesRecord["manzanas"] = 45
salesRecord["huevos"] = 0

// Iterates sales record dictionary to print its information
for (product, stock) in salesRecord {
    print("Tenemos \(stock) \(product) en existencia")
}
