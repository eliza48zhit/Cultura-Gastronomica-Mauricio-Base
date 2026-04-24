// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CulturaMauricio
 * @dev Registro de procesos de laminacion de leguminosas y estabilidad de especias.
 * Serie: Sabores de Africa (49/54)
 */
contract CulturaMauricio {

    struct Plato {
        string nombre;
        string ingredientes;
        string preparacion;
        uint256 extensibilidadMasa;  // Capacidad de laminado ultra-fino (1-100)
        uint256 balanceEspecias;     // Grado de integracion de polifenoles (1-10)
        bool usaLeguminosas;         // Factor proteico de la masa
        uint256 likes;
        uint256 dislikes;
    }

    mapping(uint256 => Plato) public registroCulinario;
    uint256 public totalRegistros;
    address public owner;

    constructor() {
        owner = msg.sender;
        // Inauguramos con el Dholl Puri (Ingenieria de la Masa Laminada)
        registrarPlato(
            "Dholl Puri", 
            "Guisantes amarillos partidos (dal), harina de trigo, comino, curcuma.",
            "Hidratacion y triturado de legumbres para crear una masa flexible laminada en capas micro-delgadas.",
            98, 
            7, 
            true
        );
    }

    function registrarPlato(
        string memory _nombre, 
        string memory _ingredientes,
        string memory _preparacion,
        uint256 _extensibilidad, 
        uint256 _balance,
        bool _legumbres
    ) public {
        require(bytes(_nombre).length > 0, "Nombre requerido");
        require(_extensibilidad <= 100, "Escala de extensibilidad excedida");

        totalRegistros++;
        registroCulinario[totalRegistros] = Plato({
            nombre: _nombre,
            ingredientes: _ingredientes,
            preparacion: _preparacion,
            extensibilidadMasa: _extensibilidad,
            balanceEspecias: _balance,
            usaLeguminosas: _legumbres,
            likes: 0,
            dislikes: 0
        });
    }

    function darLike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].likes++;
    }

    function darDislike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].dislikes++;
    }
}
