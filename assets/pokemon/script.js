const fs = require('fs');

// let resultList = {
//     "list": []
// };

// for (let i = 1; i <= 1017; i++) {
//     try {
//         let rawData = fs.readFileSync(`./pokemon_card_json/${i}.json`, 'utf8');
//         let jsonData = JSON.parse(rawData);
//         resultList.list.push(jsonData);
//     } catch (e) {
//         console.error(`Error reading file ${i}.json:`, e);
//     }
// }

// fs.writeFileSync('./pokemon_card_json/index_list.json', JSON.stringify(resultList, null, 2), 'utf8');
// console.log("All files merged into index_list.json successfully!");


for (let i = 10001; i <= 10275; i++) {
    // 读取原始JSON文件
    fs.readFile(`assets/pokemon/pokemon_json/${i}.json`, 'utf8', (err, jsonString) => {
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
            fs.appendFileSync('assets/pokemon/data.json', JSON.stringify(cardData, null, 4) + ',\n');
        } catch (err) {
            console.log("Error parsing JSON string:", err);
        }
    });
}