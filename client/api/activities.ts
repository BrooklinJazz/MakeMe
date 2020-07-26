export enum ActivityTypes {
  MIND = "mind",
  CAREER = "career",
  HEALTH = "health"
}

export const findRandom = (type: ActivityTypes) => {
  return fetch(`http://localhost:4000/api/activities/find_task_by_type?type=${type}`)
  .then((res) => res.json())
    .then((res) => {
      console.warn(res)
      return res
    })
};

export const findAnother = (parent_task: string) => {
  console.warn("FIND ANOTHER", parent_task)
  // TODO - figure out body params
  return fetch(`http://localhost:4000/api/activities/find_easier_task/?parent_task=${parent_task}`, {method: "POST"})
  .then((res) => res.json())
      .then((res) => {
        console.warn(res)
        return res
      })
};
