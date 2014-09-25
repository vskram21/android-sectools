.class Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector$1;
.super Ljava/lang/Object;
.source "DfsGarbageCollector.java"

# interfaces
.implements Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->writePack(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;Lorg/eclipse/jgit/internal/storage/pack/PackWriter;Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;

.field final synthetic val$packedObjs:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 400
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector$1;->this$0:Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;

    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector$1;->val$packedObjs:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public contains(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 1
    .parameter "objectId"

    .prologue
    .line 402
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector$1;->val$packedObjs:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->contains(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v0

    return v0
.end method
