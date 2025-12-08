const { Type, Book } = require("../models");

// Get all types
const getAllTypes = async (req, res) => {
  try {
    const types = await Type.findAll({
      include: [
        {
          model: Book,
          as: "books",
        },
      ],
    });
    res.json({ success: true, data: types });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
};

// Get type by ID
const getTypeById = async (req, res) => {
  try {
    const { id } = req.params;
    const type = await Type.findByPk(id, {
      include: [
        {
          model: Book,
          as: "books",
        },
      ],
    });
    if (!type) {
      return res.status(404).json({ success: false, error: "Type not found" });
    }
    res.json({ success: true, data: type });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
};

module.exports = {
  getAllTypes,
  getTypeById,
};



