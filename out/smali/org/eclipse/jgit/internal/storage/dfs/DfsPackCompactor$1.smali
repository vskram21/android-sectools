.class Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$1;
.super Ljava/lang/Object;
.source "DfsPackCompactor.java"

# interfaces
.implements Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->exclude(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;

.field final synthetic val$idx:Lorg/eclipse/jgit/internal/storage/file/PackIndex;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;Lorg/eclipse/jgit/internal/storage/file/PackIndex;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 188
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$1;->this$0:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;

    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$1;->val$idx:Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public contains(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 1
    .parameter "id"

    .prologue
    .line 190
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$1;->val$idx:Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->hasObject(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v0

    return v0
.end method
