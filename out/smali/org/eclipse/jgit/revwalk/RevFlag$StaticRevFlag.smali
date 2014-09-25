.class Lorg/eclipse/jgit/revwalk/RevFlag$StaticRevFlag;
.super Lorg/eclipse/jgit/revwalk/RevFlag;
.source "RevFlag.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/revwalk/RevFlag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "StaticRevFlag"
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .parameter "n"
    .parameter "m"

    .prologue
    .line 108
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2}, Lorg/eclipse/jgit/revwalk/RevFlag;-><init>(Lorg/eclipse/jgit/revwalk/RevWalk;Ljava/lang/String;I)V

    .line 109
    return-void
.end method


# virtual methods
.method public getRevWalk()Lorg/eclipse/jgit/revwalk/RevWalk;
    .locals 5

    .prologue
    .line 113
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->isAStaticFlagAndHasNorevWalkInstance:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RevFlag$StaticRevFlag;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
