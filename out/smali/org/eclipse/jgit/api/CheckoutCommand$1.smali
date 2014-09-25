.class Lorg/eclipse/jgit/api/CheckoutCommand$1;
.super Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;
.source "CheckoutCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/api/CheckoutCommand;->checkoutPathsFromIndex(Lorg/eclipse/jgit/treewalk/TreeWalk;Lorg/eclipse/jgit/dircache/DirCache;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/api/CheckoutCommand;

.field final synthetic val$r:Lorg/eclipse/jgit/lib/ObjectReader;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/api/CheckoutCommand;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectReader;)V
    .locals 0
    .parameter
    .parameter "x0"
    .parameter

    .prologue
    .line 414
    iput-object p1, p0, Lorg/eclipse/jgit/api/CheckoutCommand$1;->this$0:Lorg/eclipse/jgit/api/CheckoutCommand;

    iput-object p3, p0, Lorg/eclipse/jgit/api/CheckoutCommand$1;->val$r:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-direct {p0, p2}, Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public apply(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V
    .locals 4
    .parameter "ent"

    .prologue
    .line 416
    invoke-virtual {p1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getStage()I

    move-result v1

    .line 417
    .local v1, stage:I
    if-lez v1, :cond_2

    .line 418
    iget-object v2, p0, Lorg/eclipse/jgit/api/CheckoutCommand$1;->this$0:Lorg/eclipse/jgit/api/CheckoutCommand;

    #getter for: Lorg/eclipse/jgit/api/CheckoutCommand;->checkoutStage:Lorg/eclipse/jgit/api/CheckoutCommand$Stage;
    invoke-static {v2}, Lorg/eclipse/jgit/api/CheckoutCommand;->access$000(Lorg/eclipse/jgit/api/CheckoutCommand;)Lorg/eclipse/jgit/api/CheckoutCommand$Stage;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 419
    iget-object v2, p0, Lorg/eclipse/jgit/api/CheckoutCommand$1;->this$0:Lorg/eclipse/jgit/api/CheckoutCommand;

    #getter for: Lorg/eclipse/jgit/api/CheckoutCommand;->checkoutStage:Lorg/eclipse/jgit/api/CheckoutCommand$Stage;
    invoke-static {v2}, Lorg/eclipse/jgit/api/CheckoutCommand;->access$000(Lorg/eclipse/jgit/api/CheckoutCommand;)Lorg/eclipse/jgit/api/CheckoutCommand$Stage;

    move-result-object v2

    #getter for: Lorg/eclipse/jgit/api/CheckoutCommand$Stage;->number:I
    invoke-static {v2}, Lorg/eclipse/jgit/api/CheckoutCommand$Stage;->access$100(Lorg/eclipse/jgit/api/CheckoutCommand$Stage;)I

    move-result v2

    if-ne v1, v2, :cond_0

    .line 420
    iget-object v2, p0, Lorg/eclipse/jgit/api/CheckoutCommand$1;->this$0:Lorg/eclipse/jgit/api/CheckoutCommand;

    iget-object v3, p0, Lorg/eclipse/jgit/api/CheckoutCommand$1;->val$r:Lorg/eclipse/jgit/lib/ObjectReader;

    #calls: Lorg/eclipse/jgit/api/CheckoutCommand;->checkoutPath(Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/lib/ObjectReader;)V
    invoke-static {v2, p1, v3}, Lorg/eclipse/jgit/api/CheckoutCommand;->access$200(Lorg/eclipse/jgit/api/CheckoutCommand;Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 429
    :cond_0
    :goto_0
    return-void

    .line 422
    :cond_1
    new-instance v0, Lorg/eclipse/jgit/errors/UnmergedPathException;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/errors/UnmergedPathException;-><init>(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    .line 424
    .local v0, e:Lorg/eclipse/jgit/errors/UnmergedPathException;
    new-instance v2, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v0}, Lorg/eclipse/jgit/errors/UnmergedPathException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 427
    .end local v0           #e:Lorg/eclipse/jgit/errors/UnmergedPathException;
    :cond_2
    iget-object v2, p0, Lorg/eclipse/jgit/api/CheckoutCommand$1;->this$0:Lorg/eclipse/jgit/api/CheckoutCommand;

    iget-object v3, p0, Lorg/eclipse/jgit/api/CheckoutCommand$1;->val$r:Lorg/eclipse/jgit/lib/ObjectReader;

    #calls: Lorg/eclipse/jgit/api/CheckoutCommand;->checkoutPath(Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/lib/ObjectReader;)V
    invoke-static {v2, p1, v3}, Lorg/eclipse/jgit/api/CheckoutCommand;->access$200(Lorg/eclipse/jgit/api/CheckoutCommand;Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/lib/ObjectReader;)V

    goto :goto_0
.end method
