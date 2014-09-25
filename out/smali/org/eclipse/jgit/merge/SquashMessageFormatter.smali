.class public Lorg/eclipse/jgit/merge/SquashMessageFormatter;
.super Ljava/lang/Object;
.source "SquashMessageFormatter.java"


# instance fields
.field private dateFormatter:Lorg/eclipse/jgit/util/GitDateFormatter;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    new-instance v0, Lorg/eclipse/jgit/util/GitDateFormatter;

    sget-object v1, Lorg/eclipse/jgit/util/GitDateFormatter$Format;->DEFAULT:Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/util/GitDateFormatter;-><init>(Lorg/eclipse/jgit/util/GitDateFormatter$Format;)V

    iput-object v0, p0, Lorg/eclipse/jgit/merge/SquashMessageFormatter;->dateFormatter:Lorg/eclipse/jgit/util/GitDateFormatter;

    .line 67
    return-void
.end method

.method private toString(Lorg/eclipse/jgit/lib/PersonIdent;)Ljava/lang/String;
    .locals 2
    .parameter "author"

    .prologue
    .line 93
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 95
    .local v0, a:Ljava/lang/StringBuilder;
    const-string v1, "Author: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/PersonIdent;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    const-string v1, " <"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/PersonIdent;->getEmailAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    const-string v1, ">\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    const-string v1, "Date:   "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    iget-object v1, p0, Lorg/eclipse/jgit/merge/SquashMessageFormatter;->dateFormatter:Lorg/eclipse/jgit/util/GitDateFormatter;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/util/GitDateFormatter;->formatDate(Lorg/eclipse/jgit/lib/PersonIdent;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public format(Ljava/util/List;Lorg/eclipse/jgit/lib/Ref;)Ljava/lang/String;
    .locals 4
    .parameter
    .parameter "target"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/revwalk/RevCommit;",
            ">;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 78
    .local p1, squashedCommits:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/revwalk/RevCommit;>;"
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 79
    .local v2, sb:Ljava/lang/StringBuilder;
    const-string v3, "Squashed commit of the following:\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 81
    .local v0, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    const-string v3, "\ncommit "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getAuthorIdent()Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/eclipse/jgit/merge/SquashMessageFormatter;->toString(Lorg/eclipse/jgit/lib/PersonIdent;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    const-string v3, "\n\t"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getShortMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 89
    .end local v0           #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_0
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
