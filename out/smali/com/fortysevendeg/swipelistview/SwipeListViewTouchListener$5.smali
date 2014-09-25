.class Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$5;
.super Lcom/nineoldandroids/animation/AnimatorListenerAdapter;
.source "SwipeListViewTouchListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->generateDismissAnimate(Landroid/view/View;ZZI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

.field final synthetic val$position:I

.field final synthetic val$swap:Z

.field final synthetic val$view:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;ZLandroid/view/View;I)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 578
    iput-object p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$5;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    iput-boolean p2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$5;->val$swap:Z

    iput-object p3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$5;->val$view:Landroid/view/View;

    iput p4, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$5;->val$position:I

    invoke-direct {p0}, Lcom/nineoldandroids/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Lcom/nineoldandroids/animation/Animator;)V
    .locals 4
    .parameter "animation"

    .prologue
    .line 581
    iget-boolean v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$5;->val$swap:Z

    if-eqz v0, :cond_0

    .line 582
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$5;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->closeOpenedItems()V

    .line 583
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$5;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    iget-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$5;->val$view:Landroid/view/View;

    iget v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$5;->val$position:I

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->performDismiss(Landroid/view/View;IZ)V

    .line 585
    :cond_0
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$5;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    #calls: Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->resetCell()V
    invoke-static {v0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->access$200(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)V

    .line 586
    return-void
.end method
