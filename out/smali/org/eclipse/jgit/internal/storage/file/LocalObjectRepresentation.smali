.class Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;
.super Lorg/eclipse/jgit/internal/storage/pack/StoredObjectRepresentation;
.source "LocalObjectRepresentation.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation$Delta;
    }
.end annotation


# instance fields
.field private baseId:Lorg/eclipse/jgit/lib/ObjectId;

.field private baseOffset:J

.field length:J

.field offset:J

.field pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 51
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/pack/StoredObjectRepresentation;-><init>()V

    .line 112
    return-void
.end method

.method static newDelta(Lorg/eclipse/jgit/internal/storage/file/PackFile;JJJ)Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;
    .locals 2
    .parameter "f"
    .parameter "p"
    .parameter "n"
    .parameter "base"

    .prologue
    .line 77
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation$Delta;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation$Delta;-><init>(Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation$1;)V

    .line 78
    .local v0, r:Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;
    iput-object p0, v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;->pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 79
    iput-wide p1, v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;->offset:J

    .line 80
    iput-wide p3, v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;->length:J

    .line 81
    iput-wide p5, v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;->baseOffset:J

    .line 82
    return-object v0
.end method

.method static newDelta(Lorg/eclipse/jgit/internal/storage/file/PackFile;JJLorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;
    .locals 2
    .parameter "f"
    .parameter "p"
    .parameter "n"
    .parameter "base"

    .prologue
    .line 67
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation$Delta;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation$Delta;-><init>(Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation$1;)V

    .line 68
    .local v0, r:Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;
    iput-object p0, v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;->pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 69
    iput-wide p1, v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;->offset:J

    .line 70
    iput-wide p3, v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;->length:J

    .line 71
    iput-object p5, v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;->baseId:Lorg/eclipse/jgit/lib/ObjectId;

    .line 72
    return-object v0
.end method

.method static newWhole(Lorg/eclipse/jgit/internal/storage/file/PackFile;JJ)Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;
    .locals 1
    .parameter "f"
    .parameter "p"
    .parameter "length"

    .prologue
    .line 53
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation$1;-><init>()V

    .line 59
    .local v0, r:Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;
    iput-object p0, v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;->pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 60
    iput-wide p1, v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;->offset:J

    .line 61
    iput-wide p3, v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;->length:J

    .line 62
    return-object v0
.end method


# virtual methods
.method public getDeltaBase()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 4

    .prologue
    .line 102
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;->baseId:Lorg/eclipse/jgit/lib/ObjectId;

    if-nez v1, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;->getFormat()I

    move-result v1

    if-nez v1, :cond_0

    .line 104
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;->pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;

    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;->baseOffset:J

    invoke-virtual {v1, v2, v3}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->findObjectForOffset(J)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;->baseId:Lorg/eclipse/jgit/lib/ObjectId;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;->baseId:Lorg/eclipse/jgit/lib/ObjectId;

    :goto_0
    return-object v1

    .line 105
    :catch_0
    move-exception v0

    .line 106
    .local v0, error:Ljava/io/IOException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getWeight()I
    .locals 4

    .prologue
    .line 97
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;->length:J

    const-wide/32 v2, 0x7fffffff

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method
