.class Lorg/eclipse/jgit/revwalk/filter/CommitterRevFilter$SubStringSearch;
.super Lorg/eclipse/jgit/revwalk/filter/SubStringRevFilter;
.source "CommitterRevFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/revwalk/filter/CommitterRevFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SubStringSearch"
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "patternText"

    .prologue
    .line 109
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/revwalk/filter/SubStringRevFilter;-><init>(Ljava/lang/String;)V

    .line 110
    return-void
.end method


# virtual methods
.method protected text(Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/util/RawCharSequence;
    .locals 1
    .parameter "cmit"

    .prologue
    .line 114
    invoke-static {p1}, Lorg/eclipse/jgit/revwalk/filter/CommitterRevFilter;->textFor(Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/util/RawCharSequence;

    move-result-object v0

    return-object v0
.end method
