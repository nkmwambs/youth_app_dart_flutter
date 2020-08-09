class Goal{
  int goalId;
  String goalName;
  Task task;
  
  // {goal_id:1, goalName: 'Name', Tasks: [task_id:1, task name]}

  Goal({this.goalId=0,this.goalName='',this.task});

  static List<Goal> fetchTasks(){
    return [

    ];

  }

}
class Task{

  int taskId;
  String taskName;

  Task({this.taskId=0, this.taskName=''});
}

// class GoalAndTasks{
//   String goalName;
//   String goalTask;
//   String test;

//   GoalAndTasks({this.goalName='',this.goalTask='', this.test});
// }