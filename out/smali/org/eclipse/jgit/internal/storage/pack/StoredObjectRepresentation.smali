.class public Lorg/eclipse/jgit/internal/storage/pack/StoredObjectRepresentation;
.super Ljava/lang/Object;
.source "StoredObjectRepresentation.java"


# static fields
.field public static final FORMAT_OTHER:I = 0x2

.field public static final PACK_DELTA:I = 0x0

.field public static final PACK_WHOLE:I = 0x1

.field public static final WEIGHT_UNKNOWN:I = 0x7fffffff


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDeltaBase()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 89
    const/4 v0, 0x0

    return-object v0
.end method

.method public getFormat()I
    .locals 1

    .prologue
    .line 80
    const/4 v0, 0x2

    return v0
.end method

.method public getWeight()I
    .locals 1

    .prologue
    .line 71
    const v0, 0x7fffffff

    return v0
.end method

.method public wasDeltaAttempted()Z
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 97
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/StoredObjectRepresentation;->getFormat()I

    move-result v0

    .line 98
    .local v0, fmt:I
    if-eqz v0, :cond_0

    if-ne v0, v1, :cond_1

    :cond_0
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method
