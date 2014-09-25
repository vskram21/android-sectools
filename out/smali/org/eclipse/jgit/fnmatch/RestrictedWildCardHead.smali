.class final Lorg/eclipse/jgit/fnmatch/RestrictedWildCardHead;
.super Lorg/eclipse/jgit/fnmatch/AbstractHead;
.source "RestrictedWildCardHead.java"


# instance fields
.field private final excludedCharacter:C


# direct methods
.method constructor <init>(CZ)V
    .locals 0
    .parameter "excludedCharacter"
    .parameter "star"

    .prologue
    .line 51
    invoke-direct {p0, p2}, Lorg/eclipse/jgit/fnmatch/AbstractHead;-><init>(Z)V

    .line 52
    iput-char p1, p0, Lorg/eclipse/jgit/fnmatch/RestrictedWildCardHead;->excludedCharacter:C

    .line 53
    return-void
.end method


# virtual methods
.method protected final matches(C)Z
    .locals 1
    .parameter "c"

    .prologue
    .line 57
    iget-char v0, p0, Lorg/eclipse/jgit/fnmatch/RestrictedWildCardHead;->excludedCharacter:C

    if-eq p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
