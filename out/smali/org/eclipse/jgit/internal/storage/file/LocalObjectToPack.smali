.class Lorg/eclipse/jgit/internal/storage/file/LocalObjectToPack;
.super Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
.source "LocalObjectToPack.java"


# instance fields
.field length:J

.field offset:J

.field pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/lib/AnyObjectId;I)V
    .locals 0
    .parameter "src"
    .parameter "type"

    .prologue
    .line 62
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;I)V

    .line 63
    return-void
.end method


# virtual methods
.method protected clearReuseAsIs()V
    .locals 1

    .prologue
    .line 67
    invoke-super {p0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->clearReuseAsIs()V

    .line 68
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectToPack;->pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 69
    return-void
.end method

.method public select(Lorg/eclipse/jgit/internal/storage/pack/StoredObjectRepresentation;)V
    .locals 3
    .parameter "ref"

    .prologue
    .line 73
    move-object v0, p1

    check-cast v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;

    .line 74
    .local v0, ptr:Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;
    iget-object v1, v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;->pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectToPack;->pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 75
    iget-wide v1, v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;->offset:J

    iput-wide v1, p0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectToPack;->offset:J

    .line 76
    iget-wide v1, v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;->length:J

    iput-wide v1, p0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectToPack;->length:J

    .line 77
    return-void
.end method
