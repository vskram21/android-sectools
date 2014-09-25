.class final Lorg/eclipse/jgit/fnmatch/WildCardHead;
.super Lorg/eclipse/jgit/fnmatch/AbstractHead;
.source "WildCardHead.java"


# direct methods
.method constructor <init>(Z)V
    .locals 0
    .parameter "star"

    .prologue
    .line 49
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/fnmatch/AbstractHead;-><init>(Z)V

    .line 50
    return-void
.end method


# virtual methods
.method protected final matches(C)Z
    .locals 1
    .parameter "c"

    .prologue
    .line 54
    const/4 v0, 0x1

    return v0
.end method
