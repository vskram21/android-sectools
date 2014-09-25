.class Lorg/eclipse/jgit/api/StashCreateCommand$1;
.super Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;
.source "StashCreateCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/api/StashCreateCommand;->call()Lorg/eclipse/jgit/revwalk/RevCommit;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/api/StashCreateCommand;

.field final synthetic val$entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/api/StashCreateCommand;Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/dircache/DirCacheEntry;)V
    .locals 0
    .parameter
    .parameter "x0"
    .parameter

    .prologue
    .line 306
    iput-object p1, p0, Lorg/eclipse/jgit/api/StashCreateCommand$1;->this$0:Lorg/eclipse/jgit/api/StashCreateCommand;

    iput-object p3, p0, Lorg/eclipse/jgit/api/StashCreateCommand$1;->val$entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;

    invoke-direct {p0, p2}, Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;-><init>(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    return-void
.end method


# virtual methods
.method public apply(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V
    .locals 1
    .parameter "ent"

    .prologue
    .line 308
    iget-object v0, p0, Lorg/eclipse/jgit/api/StashCreateCommand$1;->val$entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->copyMetaData(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    .line 309
    return-void
.end method
