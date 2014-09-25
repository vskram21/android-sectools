.class Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$11;
.super Ljava/lang/Object;
.source "SwipeListViewTouchListener.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->handlerPendingDismisses(I)V
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
    .line 1069
    iput-object p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$11;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    iput p2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$11;->val$originalHeight:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 1072
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$11;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    iget v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$11;->val$originalHeight:I

    #calls: Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->removePendingDismisses(I)V
    invoke-static {v0, v1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->access$800(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;I)V

    .line 1073
    return-void
.end method
