.class public Lorg/eclipse/jgit/transport/BaseReceivePack$FirstLine;
.super Ljava/lang/Object;
.source "BaseReceivePack.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/BaseReceivePack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FirstLine"
.end annotation


# instance fields
.field private final capabilities:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final line:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 9
    .parameter "line"

    .prologue
    const/4 v8, 0x0

    .line 118
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 119
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 120
    .local v2, caps:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-virtual {p1, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    .line 121
    .local v5, nul:I
    if-ltz v5, :cond_1

    .line 122
    add-int/lit8 v6, v5, 0x1

    invoke-virtual {p1, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .local v0, arr$:[Ljava/lang/String;
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v1, v0, v3

    .line 123
    .local v1, c:Ljava/lang/String;
    invoke-virtual {v2, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 122
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 124
    .end local v1           #c:Ljava/lang/String;
    :cond_0
    invoke-virtual {p1, v8, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lorg/eclipse/jgit/transport/BaseReceivePack$FirstLine;->line:Ljava/lang/String;

    .line 127
    .end local v0           #arr$:[Ljava/lang/String;
    .end local v3           #i$:I
    .end local v4           #len$:I
    :goto_1
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v6

    iput-object v6, p0, Lorg/eclipse/jgit/transport/BaseReceivePack$FirstLine;->capabilities:Ljava/util/Set;

    .line 128
    return-void

    .line 126
    :cond_1
    iput-object p1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack$FirstLine;->line:Ljava/lang/String;

    goto :goto_1
.end method


# virtual methods
.method public getCapabilities()Ljava/util/Set;
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
    .line 137
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack$FirstLine;->capabilities:Ljava/util/Set;

    return-object v0
.end method

.method public getLine()Ljava/lang/String;
    .locals 1

    .prologue
    .line 132
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack$FirstLine;->line:Ljava/lang/String;

    return-object v0
.end method
