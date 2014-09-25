.class Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$8;
.super Lcom/nineoldandroids/animation/AnimatorListenerAdapter;
.source "SwipeListViewTouchListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->performDismiss(Landroid/view/View;IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

.field final synthetic val$originalHeight:I


# direct methods
.method constructor <init>(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1026
    iput-object p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$8;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    iput p2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$8;->val$originalHeight:I

    invoke-direct {p0}, Lcom/nineoldandroids/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Lcom/nineoldandroids/animation/Animator;)V
    .locals 2
    .parameter "animation"

    .prologue
    .line 1029
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$8;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-static {v0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->access$706(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)I

    .line 1030
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$8;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    #getter for: Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->dismissAnimationRefCount:I
    invoke-static {v0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->access$700(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)I

    move-result v0

    if-nez v0, :cond_0

    .line 1031
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$8;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    iget v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$8;->val$originalHeight:I

    #calls: Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->removePendingDismisses(I)V
    invoke-static {v0, v1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->access$800(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;I)V

    .line 1033
    :cond_0
    return-void
.end method
