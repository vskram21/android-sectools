.class final Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation$1;
.super Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;
.source "LocalObjectRepresentation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;->newWhole(Lorg/eclipse/jgit/internal/storage/file/PackFile;JJ)Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 53
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;-><init>()V

    return-void
.end method


# virtual methods
.method public getFormat()I
    .locals 1

    .prologue
    .line 56
    const/4 v0, 0x1

    return v0
.end method
