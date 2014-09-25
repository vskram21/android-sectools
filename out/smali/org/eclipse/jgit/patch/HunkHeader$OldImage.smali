.class public abstract Lorg/eclipse/jgit/patch/HunkHeader$OldImage;
.super Ljava/lang/Object;
.source "HunkHeader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/patch/HunkHeader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "OldImage"
.end annotation


# instance fields
.field lineCount:I

.field nAdded:I

.field nDeleted:I

.field startLine:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract getId()Lorg/eclipse/jgit/lib/AbbreviatedObjectId;
.end method

.method public getLineCount()I
    .locals 1

    .prologue
    .line 83
    iget v0, p0, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->lineCount:I

    return v0
.end method

.method public getLinesAdded()I
    .locals 1

    .prologue
    .line 93
    iget v0, p0, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->nAdded:I

    return v0
.end method

.method public getLinesDeleted()I
    .locals 1

    .prologue
    .line 88
    iget v0, p0, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->nDeleted:I

    return v0
.end method

.method public getStartLine()I
    .locals 1

    .prologue
    .line 78
    iget v0, p0, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->startLine:I

    return v0
.end method
