.class public Lorg/eclipse/jgit/errors/NoClosingBracketException;
.super Lorg/eclipse/jgit/errors/InvalidPatternException;
.source "NoClosingBracketException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "indexOfOpeningBracket"
    .parameter "openingBracket"
    .parameter "closingBracket"
    .parameter "pattern"

    .prologue
    .line 73
    invoke-static {p1, p2, p3}, Lorg/eclipse/jgit/errors/NoClosingBracketException;->createMessage(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p4}, Lorg/eclipse/jgit/errors/InvalidPatternException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    return-void
.end method

.method private static createMessage(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "indexOfOpeningBracket"
    .parameter "openingBracket"
    .parameter "closingBracket"

    .prologue
    .line 79
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->noClosingBracket:Ljava/lang/String;

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    const/4 v2, 0x2

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
