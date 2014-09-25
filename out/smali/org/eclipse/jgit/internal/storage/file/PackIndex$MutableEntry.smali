.class public Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;
.super Ljava/lang/Object;
.source "PackIndex.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/PackIndex;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MutableEntry"
.end annotation


# instance fields
.field final idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

.field offset:J


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 315
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 316
    new-instance v0, Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/MutableObjectId;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    return-void
.end method


# virtual methods
.method public cloneEntry()Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;
    .locals 3

    .prologue
    .line 343
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;

    invoke-direct {v0}, Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;-><init>()V

    .line 344
    .local v0, r:Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;->ensureId()V

    .line 345
    iget-object v1, v0, Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/MutableObjectId;->fromObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 346
    iget-wide v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;->offset:J

    iput-wide v1, v0, Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;->offset:J

    .line 347
    return-object v0
.end method

.method ensureId()V
    .locals 0

    .prologue
    .line 352
    return-void
.end method

.method public getOffset()J
    .locals 2

    .prologue
    .line 326
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;->offset:J

    return-wide v0
.end method

.method public name()Ljava/lang/String;
    .locals 1

    .prologue
    .line 331
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;->ensureId()V

    .line 332
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/MutableObjectId;->name()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toObjectId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 337
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;->ensureId()V

    .line 338
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/MutableObjectId;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method
