.class public Lorg/eclipse/jgit/transport/UploadPack$FirstLine;
.super Ljava/lang/Object;
.source "UploadPack.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/UploadPack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FirstLine"
.end annotation


# instance fields
.field private final line:Ljava/lang/String;

.field private final options:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 8
    .parameter "line"

    .prologue
    const/16 v7, 0x2d

    .line 174
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 175
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-le v6, v7, :cond_2

    .line 176
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    .line 177
    .local v5, opts:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-virtual {p1, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 178
    .local v4, opt:Ljava/lang/String;
    const-string v6, " "

    invoke-virtual {v4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 179
    const/4 v6, 0x1

    invoke-virtual {v4, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 180
    :cond_0
    const-string v6, " "

    invoke-virtual {v4, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .local v0, arr$:[Ljava/lang/String;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v1, v0, v2

    .line 181
    .local v1, c:Ljava/lang/String;
    invoke-virtual {v5, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 180
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 182
    .end local v1           #c:Ljava/lang/String;
    :cond_1
    const/4 v6, 0x0

    invoke-virtual {p1, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lorg/eclipse/jgit/transport/UploadPack$FirstLine;->line:Ljava/lang/String;

    .line 183
    invoke-static {v5}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v6

    iput-object v6, p0, Lorg/eclipse/jgit/transport/UploadPack$FirstLine;->options:Ljava/util/Set;

    .line 188
    .end local v0           #arr$:[Ljava/lang/String;
    .end local v2           #i$:I
    .end local v3           #len$:I
    .end local v4           #opt:Ljava/lang/String;
    .end local v5           #opts:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    :goto_1
    return-void

    .line 185
    :cond_2
    iput-object p1, p0, Lorg/eclipse/jgit/transport/UploadPack$FirstLine;->line:Ljava/lang/String;

    .line 186
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v6

    iput-object v6, p0, Lorg/eclipse/jgit/transport/UploadPack$FirstLine;->options:Ljava/util/Set;

    goto :goto_1
.end method


# virtual methods
.method public getLine()Ljava/lang/String;
    .locals 1

    .prologue
    .line 192
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack$FirstLine;->line:Ljava/lang/String;

    return-object v0
.end method

.method public getOptions()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 197
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack$FirstLine;->options:Ljava/util/Set;

    return-object v0
.end method
