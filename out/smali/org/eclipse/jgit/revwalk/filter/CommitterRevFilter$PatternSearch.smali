.class Lorg/eclipse/jgit/revwalk/filter/CommitterRevFilter$PatternSearch;
.super Lorg/eclipse/jgit/revwalk/filter/PatternMatchRevFilter;
.source "CommitterRevFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/revwalk/filter/CommitterRevFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PatternSearch"
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 2
    .parameter "patternText"

    .prologue
    const/4 v1, 0x1

    .line 93
    const/4 v0, 0x2

    invoke-direct {p0, p1, v1, v1, v0}, Lorg/eclipse/jgit/revwalk/filter/PatternMatchRevFilter;-><init>(Ljava/lang/String;ZZI)V

    .line 94
    return-void
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
    .line 91
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/filter/CommitterRevFilter$PatternSearch;->clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 2

    .prologue
    .line 103
    new-instance v0, Lorg/eclipse/jgit/revwalk/filter/CommitterRevFilter$PatternSearch;

    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/filter/CommitterRevFilter$PatternSearch;->pattern()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/revwalk/filter/CommitterRevFilter$PatternSearch;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method protected text(Lorg/eclipse/jgit/revwalk/RevCommit;)Ljava/lang/CharSequence;
    .locals 1
    .parameter "cmit"

    .prologue
    .line 98
    invoke-static {p1}, Lorg/eclipse/jgit/revwalk/filter/CommitterRevFilter;->textFor(Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/util/RawCharSequence;

    move-result-object v0

    return-object v0
.end method
