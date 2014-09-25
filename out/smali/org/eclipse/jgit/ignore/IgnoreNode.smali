.class public Lorg/eclipse/jgit/ignore/IgnoreNode;
.super Ljava/lang/Object;
.source "IgnoreNode.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;
    }
.end annotation


# instance fields
.field private final rules:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/ignore/IgnoreRule;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/ignore/IgnoreNode;->rules:Ljava/util/List;

    .line 79
    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/ignore/IgnoreRule;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 87
    .local p1, rules:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/ignore/IgnoreRule;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    iput-object p1, p0, Lorg/eclipse/jgit/ignore/IgnoreNode;->rules:Ljava/util/List;

    .line 89
    return-void
.end method

.method private static asReader(Ljava/io/InputStream;)Ljava/io/BufferedReader;
    .locals 3
    .parameter "in"

    .prologue
    .line 111
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    sget-object v2, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    invoke-direct {v1, p0, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    return-object v0
.end method


# virtual methods
.method public getRules()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/ignore/IgnoreRule;",
            ">;"
        }
    .end annotation

    .prologue
    .line 116
    iget-object v0, p0, Lorg/eclipse/jgit/ignore/IgnoreNode;->rules:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public isIgnored(Ljava/lang/String;Z)Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;
    .locals 3
    .parameter "entryPath"
    .parameter "isDirectory"

    .prologue
    .line 131
    iget-object v2, p0, Lorg/eclipse/jgit/ignore/IgnoreNode;->rules:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 132
    sget-object v2, Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;->CHECK_PARENT:Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;

    .line 144
    :goto_0
    return-object v2

    .line 135
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/ignore/IgnoreNode;->rules:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, i:I
    :goto_1
    const/4 v2, -0x1

    if-le v0, v2, :cond_3

    .line 136
    iget-object v2, p0, Lorg/eclipse/jgit/ignore/IgnoreNode;->rules:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/ignore/IgnoreRule;

    .line 137
    .local v1, rule:Lorg/eclipse/jgit/ignore/IgnoreRule;
    invoke-virtual {v1, p1, p2}, Lorg/eclipse/jgit/ignore/IgnoreRule;->isMatch(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 138
    invoke-virtual {v1}, Lorg/eclipse/jgit/ignore/IgnoreRule;->getResult()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 139
    sget-object v2, Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;->IGNORED:Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;

    goto :goto_0

    .line 141
    :cond_1
    sget-object v2, Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;->NOT_IGNORED:Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;

    goto :goto_0

    .line 135
    :cond_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 144
    .end local v1           #rule:Lorg/eclipse/jgit/ignore/IgnoreRule;
    :cond_3
    sget-object v2, Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;->CHECK_PARENT:Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;

    goto :goto_0
.end method

.method public parse(Ljava/io/InputStream;)V
    .locals 4
    .parameter "in"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 101
    invoke-static {p1}, Lorg/eclipse/jgit/ignore/IgnoreNode;->asReader(Ljava/io/InputStream;)Ljava/io/BufferedReader;

    move-result-object v0

    .line 103
    .local v0, br:Ljava/io/BufferedReader;
    :cond_0
    :goto_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .local v1, txt:Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 104
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 105
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    const-string v2, "#"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 106
    iget-object v2, p0, Lorg/eclipse/jgit/ignore/IgnoreNode;->rules:Ljava/util/List;

    new-instance v3, Lorg/eclipse/jgit/ignore/IgnoreRule;

    invoke-direct {v3, v1}, Lorg/eclipse/jgit/ignore/IgnoreRule;-><init>(Ljava/lang/String;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 108
    :cond_1
    return-void
.end method
