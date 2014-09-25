.class Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$4;
.super Lcom/nineoldandroids/animation/AnimatorListenerAdapter;
.source "SwipeListViewTouchListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->generateChoiceAnimate(Landroid/view/View;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;


# direct methods
.method constructor <init>(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)V
    .locals 0
    .parameter

    .prologue
    .line 539
    iput-object p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$4;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-direct {p0}, Lcom/nineoldandroids/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Lcom/nineoldandroids/animation/Animator;)V
    .locals 1
    .parameter "animation"

    .prologue
    .line 542
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$4;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    #getter for: Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;
    invoke-static {v0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->access$100(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)Lcom/fortysevendeg/swipelistview/SwipeListView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/fortysevendeg/swipelistview/SwipeListView;->resetScrolling()V

    .line 543
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$4;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    #calls: Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->resetCell()V
    invoke-static {v0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->access$200(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)V

    .line 544
    return-void
.end method
