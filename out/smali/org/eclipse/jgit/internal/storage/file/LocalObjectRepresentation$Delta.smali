.class final Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation$Delta;
.super Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;
.source "LocalObjectRepresentation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Delta"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 112
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 112
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation$Delta;-><init>()V

    return-void
.end method


# virtual methods
.method public getFormat()I
    .locals 1

    .prologue
    .line 115
    const/4 v0, 0x0

    return v0
.end method
