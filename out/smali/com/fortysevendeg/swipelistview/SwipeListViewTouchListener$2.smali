.class Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$2;
.super Ljava/lang/Object;
.source "SwipeListViewTouchListener.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->setFrontView(Landroid/view/View;)V
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
    .line 149
    iput-object p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$2;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 2
    .parameter "v"

    .prologue
    .line 152
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$2;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    #getter for: Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I
    invoke-static {v0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->access$000(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)I

    move-result v0

    if-ltz v0, :cond_0

    .line 153
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$2;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    iget-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$2;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    #getter for: Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I
    invoke-static {v1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->access$000(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->openAnimate(I)V

    .line 155
    :cond_0
    const/4 v0, 0x0

    return v0
.end method
