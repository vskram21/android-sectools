.class public Lorg/eclipse/jgit/transport/PackedObjectInfo;
.super Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;
.source "PackedObjectInfo.java"


# instance fields
.field private crc:I

.field private offset:J


# direct methods
.method constructor <init>(JILorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 0
    .parameter "headerOffset"
    .parameter "packedCRC"
    .parameter "id"

    .prologue
    .line 64
    invoke-direct {p0, p4}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 65
    iput-wide p1, p0, Lorg/eclipse/jgit/transport/PackedObjectInfo;->offset:J

    .line 66
    iput p3, p0, Lorg/eclipse/jgit/transport/PackedObjectInfo;->crc:I

    .line 67
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 0
    .parameter "id"

    .prologue
    .line 76
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 77
    return-void
.end method


# virtual methods
.method public getCRC()I
    .locals 1

    .prologue
    .line 101
    iget v0, p0, Lorg/eclipse/jgit/transport/PackedObjectInfo;->crc:I

    return v0
.end method

.method public getOffset()J
    .locals 2

    .prologue
    .line 84
    iget-wide v0, p0, Lorg/eclipse/jgit/transport/PackedObjectInfo;->offset:J

    return-wide v0
.end method

.method public setCRC(I)V
    .locals 0
    .parameter "crc"

    .prologue
    .line 113
    iput p1, p0, Lorg/eclipse/jgit/transport/PackedObjectInfo;->crc:I

    .line 114
    return-void
.end method

.method public setOffset(J)V
    .locals 0
    .parameter "offset"

    .prologue
    .line 94
    iput-wide p1, p0, Lorg/eclipse/jgit/transport/PackedObjectInfo;->offset:J

    .line 95
    return-void
.end method
