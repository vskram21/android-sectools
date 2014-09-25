.class public Lorg/eclipse/jgit/util/ChangeIdUtil;
.super Ljava/lang/Object;
.source "ChangeIdUtil.java"


# static fields
.field static final CHANGE_ID:Ljava/lang/String; = "Change-Id:"

.field private static final changeIdPattern:Ljava/util/regex/Pattern;

.field private static final footerPattern:Ljava/util/regex/Pattern;

.field private static final includeInFooterPattern:Ljava/util/regex/Pattern;

.field private static final issuePattern:Ljava/util/regex/Pattern;

.field private static final trailingWhitespace:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 122
    const-string v0, "^(Bug|Issue)[a-zA-Z0-9-]*:.*$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/util/ChangeIdUtil;->issuePattern:Ljava/util/regex/Pattern;

    .line 125
    const-string v0, "(^[a-zA-Z0-9-]+:(?!//).*$)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/util/ChangeIdUtil;->footerPattern:Ljava/util/regex/Pattern;

    .line 128
    const-string v0, "(^Change-Id: *I[a-f0-9]{40}$)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/util/ChangeIdUtil;->changeIdPattern:Ljava/util/regex/Pattern;

    .line 131
    const-string v0, "^[ \\[].*$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/util/ChangeIdUtil;->includeInFooterPattern:Ljava/util/regex/Pattern;

    .line 134
    const-string v0, "\\s+$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/util/ChangeIdUtil;->trailingWhitespace:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static clean(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "msg"

    .prologue
    .line 69
    const-string v0, "(?i)(?m)^Signed-off-by:.*$\n?"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "(?m)^#.*$\n?"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "(?m)\n\n\n+"

    const-string v2, "\\\n"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "\\n*$"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "(?s)\ndiff --git.*"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static computeChangeId(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/PersonIdent;Lorg/eclipse/jgit/lib/PersonIdent;Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 6
    .parameter "treeId"
    .parameter "firstParentId"
    .parameter "author"
    .parameter "committer"
    .parameter "message"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 99
    invoke-static {p4}, Lorg/eclipse/jgit/util/ChangeIdUtil;->clean(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 100
    .local v1, cleanMessage:Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_0

    .line 101
    const/4 v2, 0x0

    .line 118
    :goto_0
    return-object v2

    .line 102
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 103
    .local v0, b:Ljava/lang/StringBuilder;
    const-string v2, "tree "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    invoke-static {p0}, Lorg/eclipse/jgit/lib/ObjectId;->toString(Lorg/eclipse/jgit/lib/ObjectId;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    const-string v2, "\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    if-eqz p1, :cond_1

    .line 107
    const-string v2, "parent "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    invoke-static {p1}, Lorg/eclipse/jgit/lib/ObjectId;->toString(Lorg/eclipse/jgit/lib/ObjectId;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    const-string v2, "\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    :cond_1
    const-string v2, "author "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    invoke-virtual {p2}, Lorg/eclipse/jgit/lib/PersonIdent;->toExternalString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    const-string v2, "\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    const-string v2, "committer "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    invoke-virtual {p3}, Lorg/eclipse/jgit/lib/PersonIdent;->toExternalString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    const-string v2, "\n\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    new-instance v2, Lorg/eclipse/jgit/lib/ObjectInserter$Formatter;

    invoke-direct {v2}, Lorg/eclipse/jgit/lib/ObjectInserter$Formatter;-><init>()V

    const/4 v3, 0x1

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "UTF-8"

    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/eclipse/jgit/lib/ObjectInserter$Formatter;->idFor(I[B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    goto :goto_0
.end method

.method public static indexOfChangeId(Ljava/lang/String;Ljava/lang/String;)I
    .locals 7
    .parameter "message"
    .parameter "delimiter"

    .prologue
    .line 231
    invoke-virtual {p0, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 232
    .local v4, lines:[Ljava/lang/String;
    const/4 v2, 0x0

    .line 233
    .local v2, indexOfChangeIdLine:I
    const/4 v1, 0x0

    .line 234
    .local v1, inFooter:Z
    array-length v5, v4

    add-int/lit8 v0, v5, -0x1

    .local v0, i:I
    :goto_0
    if-ltz v0, :cond_2

    .line 235
    if-nez v1, :cond_1

    aget-object v5, v4, v0

    invoke-static {v5}, Lorg/eclipse/jgit/util/ChangeIdUtil;->isEmptyLine(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 234
    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 237
    :cond_1
    const/4 v1, 0x1

    .line 238
    sget-object v5, Lorg/eclipse/jgit/util/ChangeIdUtil;->changeIdPattern:Ljava/util/regex/Pattern;

    aget-object v6, v4, v0

    invoke-static {v6}, Lorg/eclipse/jgit/util/ChangeIdUtil;->trimRight(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/regex/Matcher;->matches()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 239
    move v2, v0

    .line 244
    :cond_2
    const/4 v3, 0x0

    .line 245
    .local v3, indexOfChangeIdLineinString:I
    const/4 v0, 0x0

    :goto_1
    if-ge v0, v2, :cond_5

    .line 246
    aget-object v5, v4, v0

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v5, v6

    add-int/2addr v3, v5

    .line 245
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 241
    .end local v3           #indexOfChangeIdLineinString:I
    :cond_3
    aget-object v5, v4, v0

    invoke-static {v5}, Lorg/eclipse/jgit/util/ChangeIdUtil;->isEmptyLine(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_4

    if-nez v0, :cond_0

    .line 242
    :cond_4
    const/4 v5, -0x1

    .line 248
    :goto_2
    return v5

    .restart local v3       #indexOfChangeIdLineinString:I
    :cond_5
    aget-object v5, v4, v2

    const-string v6, "Change-Id:"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    add-int/2addr v5, v3

    goto :goto_2
.end method

.method public static indexOfFirstFooterLine([Ljava/lang/String;)I
    .locals 4
    .parameter "lines"

    .prologue
    .line 271
    array-length v0, p0

    .line 272
    .local v0, footerFirstLine:I
    array-length v2, p0

    add-int/lit8 v1, v2, -0x1

    .local v1, i:I
    :goto_0
    const/4 v2, 0x1

    if-le v1, v2, :cond_1

    .line 273
    sget-object v2, Lorg/eclipse/jgit/util/ChangeIdUtil;->footerPattern:Ljava/util/regex/Pattern;

    aget-object v3, p0, v1

    invoke-virtual {v2, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 274
    move v0, v1

    .line 272
    :goto_1
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 277
    :cond_0
    array-length v2, p0

    if-eq v0, v2, :cond_2

    aget-object v2, p0, v1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_2

    .line 287
    :cond_1
    :goto_2
    return v0

    .line 279
    :cond_2
    array-length v2, p0

    if-eq v0, v2, :cond_3

    sget-object v2, Lorg/eclipse/jgit/util/ChangeIdUtil;->includeInFooterPattern:Ljava/util/regex/Pattern;

    aget-object v3, p0, v1

    invoke-virtual {v2, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 281
    add-int/lit8 v0, v1, 0x1

    .line 282
    goto :goto_1

    .line 284
    :cond_3
    array-length v0, p0

    .line 285
    goto :goto_2
.end method

.method public static insertId(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)Ljava/lang/String;
    .locals 1
    .parameter "message"
    .parameter "changeId"

    .prologue
    .line 147
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/eclipse/jgit/util/ChangeIdUtil;->insertId(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static insertId(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Z)Ljava/lang/String;
    .locals 9
    .parameter "message"
    .parameter "changeId"
    .parameter "replaceExisting"

    .prologue
    .line 169
    const-string v7, "\n"

    invoke-static {p0, v7}, Lorg/eclipse/jgit/util/ChangeIdUtil;->indexOfChangeId(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 170
    .local v2, indexOfChangeId:I
    if-lez v2, :cond_2

    .line 171
    if-nez p2, :cond_0

    .line 213
    .end local p0
    :goto_0
    return-object p0

    .line 174
    .restart local p0
    :cond_0
    new-instance v6, Ljava/lang/StringBuilder;

    const/4 v7, 0x0

    invoke-virtual {p0, v7, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 176
    .local v6, ret:Ljava/lang/StringBuilder;
    const-string v7, "Change-Id:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    const-string v7, " I"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    invoke-static {p1}, Lorg/eclipse/jgit/lib/ObjectId;->toString(Lorg/eclipse/jgit/lib/ObjectId;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    const-string v7, "\n"

    invoke-virtual {p0, v7, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    .line 181
    .local v3, indexOfNextLineBreak:I
    if-lez v3, :cond_1

    .line 182
    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    :cond_1
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 187
    .end local v3           #indexOfNextLineBreak:I
    .end local v6           #ret:Ljava/lang/StringBuilder;
    :cond_2
    const-string v7, "\n"

    invoke-virtual {p0, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 188
    .local v5, lines:[Ljava/lang/String;
    invoke-static {v5}, Lorg/eclipse/jgit/util/ChangeIdUtil;->indexOfFirstFooterLine([Ljava/lang/String;)I

    move-result v0

    .line 189
    .local v0, footerFirstLine:I
    move v4, v0

    .line 190
    .local v4, insertAfter:I
    move v1, v0

    .local v1, i:I
    :goto_1
    array-length v7, v5

    if-ge v1, v7, :cond_3

    .line 191
    sget-object v7, Lorg/eclipse/jgit/util/ChangeIdUtil;->issuePattern:Ljava/util/regex/Pattern;

    aget-object v8, v5, v1

    invoke-virtual {v7, v8}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/regex/Matcher;->matches()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 192
    add-int/lit8 v4, v1, 0x1

    .line 190
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 197
    :cond_3
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 198
    .restart local v6       #ret:Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .line 199
    :goto_2
    if-ge v1, v4, :cond_4

    .line 200
    aget-object v7, v5, v1

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 203
    :cond_4
    array-length v7, v5

    if-ne v4, v7, :cond_5

    if-ne v4, v0, :cond_5

    .line 204
    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    :cond_5
    const-string v7, "Change-Id:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    const-string v7, " I"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    invoke-static {p1}, Lorg/eclipse/jgit/lib/ObjectId;->toString(Lorg/eclipse/jgit/lib/ObjectId;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    :goto_3
    array-length v7, v5

    if-ge v1, v7, :cond_6

    .line 210
    aget-object v7, v5, v1

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 213
    :cond_6
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_0
.end method

.method private static isEmptyLine(Ljava/lang/String;)Z
    .locals 1
    .parameter "line"

    .prologue
    .line 253
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static trimRight(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "s"

    .prologue
    .line 257
    sget-object v0, Lorg/eclipse/jgit/util/ChangeIdUtil;->trailingWhitespace:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
