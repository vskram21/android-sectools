.class public Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;
.super Ljava/lang/Object;
.source "PackWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ObjectType"
.end annotation


# instance fields
.field bytes:J

.field cntDeltas:J

.field cntObjects:J

.field deltaBytes:J

.field reusedDeltas:J

.field reusedObjects:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 2081
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getBytes()J
    .locals 2

    .prologue
    .line 2136
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;->bytes:J

    return-wide v0
.end method

.method public getDeltaBytes()J
    .locals 2

    .prologue
    .line 2144
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;->deltaBytes:J

    return-wide v0
.end method

.method public getDeltas()J
    .locals 2

    .prologue
    .line 2107
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;->cntDeltas:J

    return-wide v0
.end method

.method public getObjects()J
    .locals 2

    .prologue
    .line 2099
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;->cntObjects:J

    return-wide v0
.end method

.method public getReusedDeltas()J
    .locals 2

    .prologue
    .line 2127
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;->reusedDeltas:J

    return-wide v0
.end method

.method public getReusedObjects()J
    .locals 2

    .prologue
    .line 2116
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;->reusedObjects:J

    return-wide v0
.end method
