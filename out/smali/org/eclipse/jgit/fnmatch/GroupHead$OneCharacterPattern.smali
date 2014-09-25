.class final Lorg/eclipse/jgit/fnmatch/GroupHead$OneCharacterPattern;
.super Ljava/lang/Object;
.source "GroupHead.java"

# interfaces
.implements Lorg/eclipse/jgit/fnmatch/GroupHead$CharacterPattern;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/fnmatch/GroupHead;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "OneCharacterPattern"
.end annotation


# instance fields
.field private expectedCharacter:C


# direct methods
.method constructor <init>(C)V
    .locals 0
    .parameter "c"

    .prologue
    .line 210
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 211
    iput-char p1, p0, Lorg/eclipse/jgit/fnmatch/GroupHead$OneCharacterPattern;->expectedCharacter:C

    .line 212
    return-void
.end method


# virtual methods
.method public final matches(C)Z
    .locals 1
    .parameter "c"

    .prologue
    .line 215
    iget-char v0, p0, Lorg/eclipse/jgit/fnmatch/GroupHead$OneCharacterPattern;->expectedCharacter:C

    if-ne v0, p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
