export const findRandom = () => {
  return fetch("http://localhost:4000/api/activities/find_random")
    .then((res) => res.json())
};

export const findAnother = () => {
  return fetch("http://localhost:4000/api/activities/find_another")
    .then((res) => res.json())
};
