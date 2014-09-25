.class Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$9;
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

.field final synthetic val$dismissView:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;Landroid/view/View;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1037
    iput-object p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$9;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    iput-object p2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$9;->val$dismissView:Landroid/view/View;

    invoke-direct {p0}, Lcom/nineoldandroids/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Lcom/nineoldandroids/animation/Animator;)V
    .locals 2
    .parameter "animation"

    .prologue
    .line 1040
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$9;->val$dismissView:Landroid/view/View;

    check-cast v0, Landroid/view/ViewGroup;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->enableDisableViewGroup(Landroid/view/ViewGroup;Z)V

    .line 1041
    return-void
.end method
