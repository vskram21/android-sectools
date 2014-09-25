.class final Lorg/eclipse/jgit/fnmatch/CharacterHead;
.super Lorg/eclipse/jgit/fnmatch/AbstractHead;
.source "CharacterHead.java"


# instance fields
.field private final expectedCharacter:C


# direct methods
.method protected constructor <init>(C)V
    .locals 1
    .parameter "expectedCharacter"

    .prologue
    .line 51
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/fnmatch/AbstractHead;-><init>(Z)V

    .line 52
    iput-char p1, p0, Lorg/eclipse/jgit/fnmatch/CharacterHead;->expectedCharacter:C

    .line 53
    return-void
.end method


# virtual methods
.method protected final matches(C)Z
    .locals 1
    .parameter "c"

    .prologue
    .line 57
    iget-char v0, p0, Lorg/eclipse/jgit/fnmatch/CharacterHead;->expectedCharacter:C

    if-ne p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
