const fs = require('fs');

for (let i = 10001; i <= 10275; i++) {
    // 读取原始JSON文件
    fs.readFile(`../../assets/pokemon/pokemon_json/${i}.json`, 'utf8', (err, jsonString) => {
        if (err) {
            console.log("Error reading file:", err);
            return;
        }

        try {
            const pokemon = JSON.parse(jsonString);

            // 提取并转换数据
            const cardData = {
                id: pokemon.id,
                name: pokemon.name,
                types: pokemon.types.map(typeEntry => typeEntry.type.name)
            };

            // 保存新的JSON文件
            fs.writeFile(`../../assets/pokemon/pokemon_card_json/${i}.json`, JSON.stringify(cardData, null, 4), err => {
                if (err) {
                    console.error("Error writing to file:", err);
                } else {
                    console.log("Successfully wrote to new file.");
                }
            });

        } catch (err) {
            console.log("Error parsing JSON string:", err);
        }
    });
}