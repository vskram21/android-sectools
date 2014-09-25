.class public abstract Lorg/eclipse/jgit/revwalk/filter/SubStringRevFilter;
.super Lorg/eclipse/jgit/revwalk/filter/RevFilter;
.source "SubStringRevFilter.java"


# instance fields
.field private final pattern:Lorg/eclipse/jgit/util/RawSubStringPattern;


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "patternText"

    .prologue
    .line 96
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;-><init>()V

    .line 97
    new-instance v0, Lorg/eclipse/jgit/util/RawSubStringPattern;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/util/RawSubStringPattern;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/filter/SubStringRevFilter;->pattern:Lorg/eclipse/jgit/util/RawSubStringPattern;

    .line 98
    return-void
.end method

.method public static safe(Ljava/lang/String;)Z
    .locals 3
    .parameter "pattern"

    .prologue
    .line 66
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 67
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 68
    .local v0, c:C
    sparse-switch v0, :sswitch_data_0

    .line 66
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 80
    :sswitch_0
    const/4 v2, 0x0

    .line 83
    .end local v0           #c:C
    :goto_1
    return v2

    :cond_0
    const/4 v2, 0x1

    goto :goto_1

    .line 68
    nop

    :sswitch_data_0
    .sparse-switch
        0x28 -> :sswitch_0
        0x29 -> :sswitch_0
        0x2a -> :sswitch_0
        0x2b -> :sswitch_0
        0x2e -> :sswitch_0
        0x3f -> :sswitch_0
        0x5b -> :sswitch_0
        0x5c -> :sswitch_0
        0x5d -> :sswitch_0
        0x7b -> :sswitch_0
        0x7d -> :sswitch_0
    .end sparse-switch
.end method


# virtual methods
.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 56
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/filter/SubStringRevFilter;->clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 0

    .prologue
    .line 123
    return-object p0
.end method

.method public include(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/RevCommit;)Z
    .locals 2
    .parameter "walker"
    .parameter "cmit"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 104
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/filter/SubStringRevFilter;->pattern:Lorg/eclipse/jgit/util/RawSubStringPattern;

    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/revwalk/filter/SubStringRevFilter;->text(Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/util/RawCharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/util/RawSubStringPattern;->match(Lorg/eclipse/jgit/util/RawCharSequence;)I

    move-result v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public requiresCommitBody()Z
    .locals 1

    .prologue
    .line 109
    const/4 v0, 0x1

    return v0
.end method

.method protected abstract text(Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/util/RawCharSequence;
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 129
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "(\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/filter/SubStringRevFilter;->pattern:Lorg/eclipse/jgit/util/RawSubStringPattern;

    invoke-virtual {v1}, Lorg/eclipse/jgit/util/RawSubStringPattern;->pattern()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
