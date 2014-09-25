.class Lorg/eclipse/jgit/api/CheckoutCommand$2;
.super Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;
.source "CheckoutCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/api/CheckoutCommand;->checkoutPathsFromCommit(Lorg/eclipse/jgit/treewalk/TreeWalk;Lorg/eclipse/jgit/dircache/DirCache;Lorg/eclipse/jgit/revwalk/RevCommit;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/api/CheckoutCommand;

.field final synthetic val$blobId:Lorg/eclipse/jgit/lib/ObjectId;

.field final synthetic val$mode:Lorg/eclipse/jgit/lib/FileMode;

.field final synthetic val$r:Lorg/eclipse/jgit/lib/ObjectReader;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/api/CheckoutCommand;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/ObjectReader;)V
    .locals 0
    .parameter
    .parameter "x0"
    .parameter
    .parameter
    .parameter

    .prologue
    .line 443
    iput-object p1, p0, Lorg/eclipse/jgit/api/CheckoutCommand$2;->this$0:Lorg/eclipse/jgit/api/CheckoutCommand;

    iput-object p3, p0, Lorg/eclipse/jgit/api/CheckoutCommand$2;->val$blobId:Lorg/eclipse/jgit/lib/ObjectId;

    iput-object p4, p0, Lorg/eclipse/jgit/api/CheckoutCommand$2;->val$mode:Lorg/eclipse/jgit/lib/FileMode;

    iput-object p5, p0, Lorg/eclipse/jgit/api/CheckoutCommand$2;->val$r:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-direct {p0, p2}, Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public apply(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V
    .locals 2
    .parameter "ent"

    .prologue
    .line 445
    iget-object v0, p0, Lorg/eclipse/jgit/api/CheckoutCommand$2;->val$blobId:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 446
    iget-object v0, p0, Lorg/eclipse/jgit/api/CheckoutCommand$2;->val$mode:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setFileMode(Lorg/eclipse/jgit/lib/FileMode;)V

    .line 447
    iget-object v0, p0, Lorg/eclipse/jgit/api/CheckoutCommand$2;->this$0:Lorg/eclipse/jgit/api/CheckoutCommand;

    iget-object v1, p0, Lorg/eclipse/jgit/api/CheckoutCommand$2;->val$r:Lorg/eclipse/jgit/lib/ObjectReader;

    #calls: Lorg/eclipse/jgit/api/CheckoutCommand;->checkoutPath(Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/lib/ObjectReader;)V
    invoke-static {v0, p1, v1}, Lorg/eclipse/jgit/api/CheckoutCommand;->access$200(Lorg/eclipse/jgit/api/CheckoutCommand;Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 448
    return-void
.end method
