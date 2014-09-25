.class Lorg/eclipse/jgit/transport/WalkEncryption$NoEncryption;
.super Lorg/eclipse/jgit/transport/WalkEncryption;
.source "WalkEncryption.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/WalkEncryption;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "NoEncryption"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 106
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/WalkEncryption;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/transport/WalkEncryption$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 106
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/WalkEncryption$NoEncryption;-><init>()V

    return-void
.end method


# virtual methods
.method decrypt(Ljava/io/InputStream;)Ljava/io/InputStream;
    .locals 0
    .parameter "in"

    .prologue
    .line 120
    return-object p1
.end method

.method encrypt(Ljava/io/OutputStream;)Ljava/io/OutputStream;
    .locals 0
    .parameter "os"

    .prologue
    .line 125
    return-object p1
.end method

.method request(Ljava/net/HttpURLConnection;Ljava/lang/String;)V
    .locals 0
    .parameter "u"
    .parameter "prefix"

    .prologue
    .line 110
    return-void
.end method

.method validate(Ljava/net/HttpURLConnection;Ljava/lang/String;)V
    .locals 2
    .parameter "u"
    .parameter "p"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 115
    const-string v0, ""

    const-string v1, ""

    invoke-virtual {p0, p1, p2, v0, v1}, Lorg/eclipse/jgit/transport/WalkEncryption$NoEncryption;->validateImpl(Ljava/net/HttpURLConnection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    return-void
.end method
