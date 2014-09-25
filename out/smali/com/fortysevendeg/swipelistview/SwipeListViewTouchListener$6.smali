.class Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$6;
.super Lcom/nineoldandroids/animation/AnimatorListenerAdapter;
.source "SwipeListViewTouchListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->generateRevealAnimate(Landroid/view/View;ZZI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

.field final synthetic val$position:I

.field final synthetic val$swap:Z

.field final synthetic val$swapRight:Z


# direct methods
.method constructor <init>(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;ZIZ)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 614
    iput-object p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$6;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    iput-boolean p2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$6;->val$swap:Z

    iput p3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$6;->val$position:I

    iput-boolean p4, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$6;->val$swapRight:Z

    invoke-direct {p0}, Lcom/nineoldandroids/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Lcom/nineoldandroids/animation/Animator;)V
    .locals 5
    .parameter "animation"

    .prologue
    .line 617
    iget-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$6;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    #getter for: Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;
    invoke-static {v1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->access$100(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)Lcom/fortysevendeg/swipelistview/SwipeListView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/fortysevendeg/swipelistview/SwipeListView;->resetScrolling()V

    .line 618
    iget-boolean v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$6;->val$swap:Z

    if-eqz v1, :cond_0

    .line 619
    iget-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$6;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    #getter for: Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->opened:Ljava/util/List;
    invoke-static {v1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->access$300(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)Ljava/util/List;

    move-result-object v1

    iget v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$6;->val$position:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_1

    const/4 v0, 0x1

    .line 620
    .local v0, aux:Z
    :goto_0
    iget-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$6;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    #getter for: Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->opened:Ljava/util/List;
    invoke-static {v1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->access$300(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)Ljava/util/List;

    move-result-object v1

    iget v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$6;->val$position:I

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 621
    if-eqz v0, :cond_2

    .line 622
    iget-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$6;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    #getter for: Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;
    invoke-static {v1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->access$100(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)Lcom/fortysevendeg/swipelistview/SwipeListView;

    move-result-object v1

    iget v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$6;->val$position:I

    iget-boolean v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$6;->val$swapRight:Z

    invoke-virtual {v1, v2, v3}, Lcom/fortysevendeg/swipelistview/SwipeListView;->onOpened(IZ)V

    .line 623
    iget-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$6;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    #getter for: Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->openedRight:Ljava/util/List;
    invoke-static {v1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->access$400(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)Ljava/util/List;

    move-result-object v1

    iget v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$6;->val$position:I

    iget-boolean v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$6;->val$swapRight:Z

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 628
    .end local v0           #aux:Z
    :cond_0
    :goto_1
    iget-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$6;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    #calls: Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->resetCell()V
    invoke-static {v1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->access$200(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)V

    .line 629
    return-void

    .line 619
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 625
    .restart local v0       #aux:Z
    :cond_2
    iget-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$6;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    #getter for: Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;
    invoke-static {v1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->access$100(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)Lcom/fortysevendeg/swipelistview/SwipeListView;

    move-result-object v2

    iget v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$6;->val$position:I

    iget-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$6;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    #getter for: Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->openedRight:Ljava/util/List;
    invoke-static {v1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->access$400(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)Ljava/util/List;

    move-result-object v1

    iget v4, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$6;->val$position:I

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v2, v3, v1}, Lcom/fortysevendeg/swipelistview/SwipeListView;->onClosed(IZ)V

    goto :goto_1
.end method
