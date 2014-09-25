.class Lorg/eclipse/jgit/diff/ContentSource$ObjectReaderSource;
.super Lorg/eclipse/jgit/diff/ContentSource;
.source "ContentSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/diff/ContentSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ObjectReaderSource"
.end annotation


# instance fields
.field private final reader:Lorg/eclipse/jgit/lib/ObjectReader;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/lib/ObjectReader;)V
    .locals 0
    .parameter "reader"

    .prologue
    .line 129
    invoke-direct {p0}, Lorg/eclipse/jgit/diff/ContentSource;-><init>()V

    .line 130
    iput-object p1, p0, Lorg/eclipse/jgit/diff/ContentSource$ObjectReaderSource;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    .line 131
    return-void
.end method


# virtual methods
.method public open(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;
    .locals 2
    .parameter "path"
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 140
    iget-object v0, p0, Lorg/eclipse/jgit/diff/ContentSource$ObjectReaderSource;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    const/4 v1, 0x3

    invoke-virtual {v0, p2, v1}, Lorg/eclipse/jgit/lib/ObjectReader;->open(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v0

    return-object v0
.end method

.method public size(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)J
    .locals 2
    .parameter "path"
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 135
    iget-object v0, p0, Lorg/eclipse/jgit/diff/ContentSource$ObjectReaderSource;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    const/4 v1, 0x3

    invoke-virtual {v0, p2, v1}, Lorg/eclipse/jgit/lib/ObjectReader;->getObjectSize(Lorg/eclipse/jgit/lib/AnyObjectId;I)J

    move-result-wide v0

    return-wide v0
.end method
