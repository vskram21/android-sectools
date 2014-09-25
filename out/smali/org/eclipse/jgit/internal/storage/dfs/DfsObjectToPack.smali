.class Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;
.super Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
.source "DfsObjectToPack.java"


# static fields
.field private static final FLAG_FOUND:I = 0x1


# instance fields
.field length:J

.field offset:J

.field pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/lib/AnyObjectId;I)V
    .locals 0
    .parameter "src"
    .parameter "type"

    .prologue
    .line 64
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;I)V

    .line 65
    return-void
.end method


# virtual methods
.method protected clearReuseAsIs()V
    .locals 1

    .prologue
    .line 77
    invoke-super {p0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->clearReuseAsIs()V

    .line 78
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;->pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    .line 79
    return-void
.end method

.method final isFound()Z
    .locals 1

    .prologue
    .line 68
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;->isExtendedFlag(I)Z

    move-result v0

    return v0
.end method

.method public select(Lorg/eclipse/jgit/internal/storage/pack/StoredObjectRepresentation;)V
    .locals 3
    .parameter "ref"

    .prologue
    .line 83
    move-object v0, p1

    check-cast v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;

    .line 84
    .local v0, ptr:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;
    iget-object v1, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;->pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;->pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    .line 85
    iget-wide v1, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;->offset:J

    iput-wide v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;->offset:J

    .line 86
    iget-wide v1, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;->length:J

    iput-wide v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;->length:J

    .line 87
    return-void
.end method

.method final setFound()V
    .locals 1

    .prologue
    .line 72
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;->setExtendedFlag(I)V

    .line 73
    return-void
.end method
