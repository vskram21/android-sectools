.class public Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;
.super Ljava/lang/Object;
.source "PackParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/PackParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "UnresolvedDelta"
.end annotation


# instance fields
.field crc:I

.field next:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

.field position:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 1528
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getCRC()I
    .locals 1

    .prologue
    .line 1542
    iget v0, p0, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;->crc:I

    return v0
.end method

.method public getOffset()J
    .locals 2

    .prologue
    .line 1537
    iget-wide v0, p0, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;->position:J

    return-wide v0
.end method

.method public setCRC(I)V
    .locals 0
    .parameter "crc32"

    .prologue
    .line 1550
    iput p1, p0, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;->crc:I

    .line 1551
    return-void
.end method
