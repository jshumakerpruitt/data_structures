function LinkedList(){
    var outerThis = this;

    function Node(item){
	this.item = item;
	this.next = null;
    }

    this.first =  null;

    this.push = function(item){
	var newFirst = new Node(item);
	newFirst.next = this.first;
	this.first = newFirst;
    };

    this.pop = function(){
	var poppedItem = this.first.item;
	this.first = this.first.next;
	return poppedItem;
    };
}
