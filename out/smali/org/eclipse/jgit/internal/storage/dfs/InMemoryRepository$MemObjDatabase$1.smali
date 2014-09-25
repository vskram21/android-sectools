.class Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemObjDatabase$1;
.super Lorg/eclipse/jgit/internal/storage/dfs/InMemoryOutputStream;
.source "InMemoryRepository.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemObjDatabase;->writeFile(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemObjDatabase;

.field final synthetic val$ext:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

.field final synthetic val$memPack:Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemPack;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemObjDatabase;Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemPack;Lorg/eclipse/jgit/internal/storage/pack/PackExt;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 119
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemObjDatabase$1;->this$1:Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemObjDatabase;

    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemObjDatabase$1;->val$memPack:Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemPack;

    iput-object p3, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemObjDatabase$1;->val$ext:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryOutputStream;-><init>()V

    return-void
.end method


# virtual methods
.method public flush()V
    .locals 3

    .prologue
    .line 122
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemObjDatabase$1;->val$memPack:Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemPack;

    #getter for: Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemPack;->fileMap:Ljava/util/Map;
    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemPack;->access$100(Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemPack;)Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemObjDatabase$1;->val$ext:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemObjDatabase$1;->getData()[B

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    return-void
.end method
