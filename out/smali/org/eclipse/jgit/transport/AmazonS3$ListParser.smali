.class final Lorg/eclipse/jgit/transport/AmazonS3$ListParser;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "AmazonS3.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/AmazonS3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ListParser"
.end annotation


# instance fields
.field private final bucket:Ljava/lang/String;

.field private data:Ljava/lang/StringBuilder;

.field final entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final prefix:Ljava/lang/String;

.field final synthetic this$0:Lorg/eclipse/jgit/transport/AmazonS3;

.field truncated:Z


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/AmazonS3;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter
    .parameter "bn"
    .parameter "p"

    .prologue
    .line 655
    iput-object p1, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->this$0:Lorg/eclipse/jgit/transport/AmazonS3;

    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 645
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->entries:Ljava/util/List;

    .line 656
    iput-object p2, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->bucket:Ljava/lang/String;

    .line 657
    iput-object p3, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->prefix:Ljava/lang/String;

    .line 658
    return-void
.end method


# virtual methods
.method public characters([CII)V
    .locals 1
    .parameter "ch"
    .parameter "s"
    .parameter "n"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 723
    iget-object v0, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->data:Ljava/lang/StringBuilder;

    if-eqz v0, :cond_0

    .line 724
    iget-object v0, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->data:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 725
    :cond_0
    return-void
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .parameter "uri"
    .parameter "name"
    .parameter "qName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 730
    const-string v0, "Key"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 731
    iget-object v0, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->entries:Ljava/util/List;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->data:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->prefix:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 734
    :cond_0
    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->data:Ljava/lang/StringBuilder;

    .line 735
    return-void

    .line 732
    :cond_1
    const-string v0, "IsTruncated"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 733
    const-string v0, "true"

    iget-object v1, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->data:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/eclipse/jgit/util/StringUtils;->equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->truncated:Z

    goto :goto_0
.end method

.method public ignorableWhitespace([CII)V
    .locals 1
    .parameter "ch"
    .parameter "s"
    .parameter "n"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 716
    iget-object v0, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->data:Ljava/lang/StringBuilder;

    if-eqz v0, :cond_0

    .line 717
    iget-object v0, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->data:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 718
    :cond_0
    return-void
.end method

.method list()V
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x0

    .line 661
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    .line 662
    .local v0, args:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v8, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->prefix:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_0

    .line 663
    const-string v8, "prefix"

    iget-object v9, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->prefix:Ljava/lang/String;

    invoke-interface {v0, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 664
    :cond_0
    iget-object v8, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->entries:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_1

    .line 665
    const-string v9, "marker"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v10, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->prefix:Ljava/lang/String;

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v8, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->entries:Ljava/util/List;

    iget-object v11, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->entries:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v11

    add-int/lit8 v11, v11, -0x1

    invoke-interface {v8, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v0, v9, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 667
    :cond_1
    const/4 v2, 0x0

    .local v2, curAttempt:I
    :goto_0
    iget-object v8, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->this$0:Lorg/eclipse/jgit/transport/AmazonS3;

    #getter for: Lorg/eclipse/jgit/transport/AmazonS3;->maxAttempts:I
    invoke-static {v8}, Lorg/eclipse/jgit/transport/AmazonS3;->access$100(Lorg/eclipse/jgit/transport/AmazonS3;)I

    move-result v8

    if-ge v2, v8, :cond_2

    .line 668
    iget-object v8, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->this$0:Lorg/eclipse/jgit/transport/AmazonS3;

    const-string v9, "GET"

    iget-object v10, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->bucket:Ljava/lang/String;

    const-string v11, ""

    #calls: Lorg/eclipse/jgit/transport/AmazonS3;->open(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/net/HttpURLConnection;
    invoke-static {v8, v9, v10, v11, v0}, Lorg/eclipse/jgit/transport/AmazonS3;->access$200(Lorg/eclipse/jgit/transport/AmazonS3;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/net/HttpURLConnection;

    move-result-object v1

    .line 669
    .local v1, c:Ljava/net/HttpURLConnection;
    iget-object v8, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->this$0:Lorg/eclipse/jgit/transport/AmazonS3;

    #calls: Lorg/eclipse/jgit/transport/AmazonS3;->authorize(Ljava/net/HttpURLConnection;)V
    invoke-static {v8, v1}, Lorg/eclipse/jgit/transport/AmazonS3;->access$300(Lorg/eclipse/jgit/transport/AmazonS3;Ljava/net/HttpURLConnection;)V

    .line 670
    invoke-static {v1}, Lorg/eclipse/jgit/util/HttpSupport;->response(Ljava/net/HttpURLConnection;)I

    move-result v8

    sparse-switch v8, :sswitch_data_0

    .line 699
    iget-object v8, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->this$0:Lorg/eclipse/jgit/transport/AmazonS3;

    const-string v9, "Listing"

    iget-object v10, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->prefix:Ljava/lang/String;

    #calls: Lorg/eclipse/jgit/transport/AmazonS3;->error(Ljava/lang/String;Ljava/lang/String;Ljava/net/HttpURLConnection;)Ljava/io/IOException;
    invoke-static {v8, v9, v10, v1}, Lorg/eclipse/jgit/transport/AmazonS3;->access$400(Lorg/eclipse/jgit/transport/AmazonS3;Ljava/lang/String;Ljava/lang/String;Ljava/net/HttpURLConnection;)Ljava/io/IOException;

    move-result-object v8

    throw v8

    .line 672
    :sswitch_0
    iput-boolean v12, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->truncated:Z

    .line 673
    const/4 v8, 0x0

    iput-object v8, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->data:Ljava/lang/StringBuilder;

    .line 677
    :try_start_0
    invoke-static {}, Lorg/xml/sax/helpers/XMLReaderFactory;->createXMLReader()Lorg/xml/sax/XMLReader;
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .line 681
    .local v7, xr:Lorg/xml/sax/XMLReader;
    invoke-interface {v7, p0}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 682
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    .line 684
    .local v4, in:Ljava/io/InputStream;
    :try_start_1
    new-instance v8, Lorg/xml/sax/InputSource;

    invoke-direct {v8, v4}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    invoke-interface {v7, v8}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Lorg/xml/sax/SAXException; {:try_start_1 .. :try_end_1} :catch_1

    .line 691
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 693
    return-void

    .line 678
    .end local v4           #in:Ljava/io/InputStream;
    .end local v7           #xr:Lorg/xml/sax/XMLReader;
    :catch_0
    move-exception v3

    .line 679
    .local v3, e:Lorg/xml/sax/SAXException;
    new-instance v8, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v9

    iget-object v9, v9, Lorg/eclipse/jgit/internal/JGitText;->noXMLParserAvailable:Ljava/lang/String;

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 685
    .end local v3           #e:Lorg/xml/sax/SAXException;
    .restart local v4       #in:Ljava/io/InputStream;
    .restart local v7       #xr:Lorg/xml/sax/XMLReader;
    :catch_1
    move-exception v6

    .line 687
    .local v6, parsingError:Lorg/xml/sax/SAXException;
    :try_start_2
    new-instance v5, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->errorListing:Ljava/lang/String;

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    iget-object v11, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->prefix:Ljava/lang/String;

    aput-object v11, v9, v10

    invoke-static {v8, v9}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v5, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 688
    .local v5, p:Ljava/io/IOException;
    invoke-virtual {v5, v6}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 689
    throw v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 691
    .end local v5           #p:Ljava/io/IOException;
    .end local v6           #parsingError:Lorg/xml/sax/SAXException;
    :catchall_0
    move-exception v8

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    throw v8

    .line 667
    .end local v4           #in:Ljava/io/InputStream;
    .end local v7           #xr:Lorg/xml/sax/XMLReader;
    :sswitch_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 702
    .end local v1           #c:Ljava/net/HttpURLConnection;
    :cond_2
    iget-object v8, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->this$0:Lorg/eclipse/jgit/transport/AmazonS3;

    const-string v9, "Listing"

    iget-object v10, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->prefix:Ljava/lang/String;

    #calls: Lorg/eclipse/jgit/transport/AmazonS3;->maxAttempts(Ljava/lang/String;Ljava/lang/String;)Ljava/io/IOException;
    invoke-static {v8, v9, v10}, Lorg/eclipse/jgit/transport/AmazonS3;->access$500(Lorg/eclipse/jgit/transport/AmazonS3;Ljava/lang/String;Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v8

    throw v8

    .line 670
    nop

    :sswitch_data_0
    .sparse-switch
        0xc8 -> :sswitch_0
        0x1f4 -> :sswitch_1
    .end sparse-switch
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 1
    .parameter "uri"
    .parameter "name"
    .parameter "qName"
    .parameter "attributes"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 709
    const-string v0, "Key"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "IsTruncated"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 710
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->data:Ljava/lang/StringBuilder;

    .line 711
    :cond_1
    return-void
.end method
