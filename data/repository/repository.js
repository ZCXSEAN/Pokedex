const axios = require('axios');
const fs = require('fs');



async function fetchAndSavePokemon(id) {
  const BASE_URL = 'https://pokeapi.co/api/v2/pokemon/';
  try {
    const response = await axios.get(`${BASE_URL}${id}/`);
    const jsonData = JSON.stringify(response.data, null, 2);
    fs.writeFileSync(`../data/pokemon/${id}.json`, jsonData);
    console.log(`Saved data for pokemon ID ${id}`);
  } catch (error) {
    console.error(`Error fetching data for pokemon ID ${id}: ${error}`);
  }
}

async function fetchAndSaveAbility(id) {
  const BASE_URL = 'https://pokeapi.co/api/v2/ability/';
  try {
    const response = await axios.get(`${BASE_URL}${id}/`);
    const jsonData = JSON.stringify(response.data, null, 2);
    fs.writeFileSync(`../data/ability/${id}.json`, jsonData);
    console.log(`Saved data for ID ${id}`);
  } catch (error) {
    // console.error(`Error fetching data for ID ${id}: ${error}`);
  }
}

async function fetchAndSaveCharacteristic(id) {
  const BASE_URL = 'https://pokeapi.co/api/v2/characteristic/';
  try {
    const response = await axios.get(`${BASE_URL}${id}/`);
    const jsonData = JSON.stringify(response.data, null, 2);
    fs.writeFileSync(`../data/characteristic/${id}.json`, jsonData);
    console.log(`Saved data for ID ${id}`);
  } catch (error) {
    // console.error(`Error fetching data for ID ${id}: ${error}`);
  }
}

async function fetchAndSaveEggGroup(id) {
  const BASE_URL = 'https://pokeapi.co/api/v2/egg-group/';
  try {
    const response = await axios.get(`${BASE_URL}${id}/`);
    const jsonData = JSON.stringify(response.data, null, 2);
    fs.writeFileSync(`../data/egg-group/${id}.json`, jsonData);
    console.log(`Saved data for ID ${id}`);
  } catch (error) {
    // console.error(`Error fetching data for ID ${id}: ${error}`);
  }
}

async function fetchAndSaveMove(id) {
  const BASE_URL = 'https://pokeapi.co/api/v2/move/';
  try {
    const response = await axios.get(`${BASE_URL}${id}/`);
    const jsonData = JSON.stringify(response.data, null, 2);
    fs.writeFileSync(`../data/move/${id}.json`, jsonData);
    console.log(`Saved data for ID ${id}`);
  } catch (error) {
    // console.error(`Error fetching data for ID ${id}: ${error}`);
  }
}

async function fetchAndSaveMoveTarget(id) {
  const BASE_URL = 'https://pokeapi.co/api/v2/move-target/';
  try {
    const response = await axios.get(`${BASE_URL}${id}/`);
    const jsonData = JSON.stringify(response.data, null, 2);
    fs.writeFileSync(`../data/move-target/${id}.json`, jsonData);
    console.log(`Saved data for ID ${id}`);
  } catch (error) {
    // console.error(`Error fetching data for ID ${id}: ${error}`);
  }
}

async function fetchAndSaveArtWork(id) {
  const BASE_URL = `https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${id}.png`;
  
  try {
      const response = await axios.get(BASE_URL, {
          responseType: 'arraybuffer'
      });

      fs.writeFileSync(`../data/artwork/${id}.png`, response.data);
      console.log(`Saved artwork for ID ${id}`);
  } catch (error) {
      console.error(`Error fetching artwork for ID ${id}: ${error.message}`);
  }
}



async function main() {
  for (let id = 10000; id <= 10300; id++) {
    fetchAndSaveArtWork(id);
  }
}

main();
