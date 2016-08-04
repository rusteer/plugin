.class public Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;
.super Lcom/ibm/mqtt/trace/MQeTraceToBinary;

# interfaces
.implements Lcom/ibm/mqtt/MQeTraceHandler;


# static fields
.field private static final CURRENT_DIRECTORY:Ljava/lang/String; = "."

.field private static final DEBUG:Z = false

.field private static final DEFAULT_DIRECTORY:Ljava/lang/String; = "."

.field private static final DEFAULT_FILES_EXISTING_AT_ONCE:I = 0x1

.field public static final DEFAULT_FILE_NAME_PREFIX:Ljava/lang/String; = "mqe"

.field public static final DEFAULT_FILE_NAME_SUFFIX:Ljava/lang/String; = ".trc"

.field static final FOOTER_BECAUSE_OF_CLOSE:S = -0x5dc1s

.field static final FOOTER_BECAUSE_OF_FINALISE:S = -0x5dc2s

.field static final FOOTER_BECAUSE_OF_WRAP:S = -0x5dc0s

.field public static final MIN_TRACE_FILE_SIZE:J = 0x830L

.field private static final NEVER_WRAP:I = -0x1

.field public static version:[S


# instance fields
.field private bytesWritten:J

.field currentFile:Ljava/io/File;

.field private currentFileOut:Ljava/io/FileOutputStream;

.field private directoryName:Ljava/lang/String;

.field private fileNameIndex:I

.field private fileNamePrefix:Ljava/lang/String;

.field private fileNameSuffix:Ljava/lang/String;

.field private filesExistingAtOnce:I

.field private footer:[B

.field private maxFileSizeBeforeWrap:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x4

    new-array v0, v0, [S

    fill-array-data v0, :array_0

    sput-object v0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->version:[S

    return-void

    nop

    :array_0
    .array-data 0x2
        0x2t 0x0t
        0x0t 0x0t
        0x0t 0x0t
        0x2t 0x0t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 7

    const-string v1, "."

    const-string v2, "mqe"

    const-string v3, ".trc"

    const/4 v4, 0x1

    const-wide/16 v5, -0x1

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IJ)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IJ)V
    .locals 8

    const-wide/16 v3, 0x830

    const-wide/16 v1, -0x1

    const/4 v7, 0x0

    const/4 v0, 0x1

    invoke-direct {p0}, Lcom/ibm/mqtt/trace/MQeTraceToBinary;-><init>()V

    iput-wide v1, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->maxFileSizeBeforeWrap:J

    iput v0, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->filesExistingAtOnce:I

    const-string v5, ".trc"

    iput-object v5, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->fileNameSuffix:Ljava/lang/String;

    const-string v5, "mqe"

    iput-object v5, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->fileNamePrefix:Ljava/lang/String;

    const-string v5, "."

    iput-object v5, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->directoryName:Ljava/lang/String;

    iput v7, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->fileNameIndex:I

    const-wide/16 v5, 0x0

    iput-wide v5, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->bytesWritten:J

    if-nez p1, :cond_0

    const-string p1, "."

    :cond_0
    iput-object p1, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->directoryName:Ljava/lang/String;

    if-nez p2, :cond_1

    const-string p2, "mqe"

    :cond_1
    iput-object p2, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->fileNamePrefix:Ljava/lang/String;

    if-nez p3, :cond_2

    const-string p3, ".trc"

    :cond_2
    iput-object p3, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->fileNameSuffix:Ljava/lang/String;

    if-ge p4, v0, :cond_3

    move p4, v0

    :cond_3
    iput p4, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->filesExistingAtOnce:I

    if-ne p4, v0, :cond_5

    move-wide p5, v1

    :cond_4
    :goto_0
    iput-wide p5, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->maxFileSizeBeforeWrap:J

    iput v7, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->fileNameIndex:I

    const/16 v0, -0x5dc1

    invoke-super {p0, v0}, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->getFooter(S)[B

    move-result-object v0

    iput-object v0, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->footer:[B

    return-void

    :cond_5
    cmp-long v0, p5, v3

    if-gez v0, :cond_4

    move-wide p5, v3

    goto :goto_0
.end method

.method private final closeFile()V
    .locals 1

    :try_start_0
    iget-object v0, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->currentFileOut:Ljava/io/FileOutputStream;

    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->currentFileOut:Ljava/io/FileOutputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method advanceFileNameIndex()V
    .locals 2

    iget v0, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->fileNameIndex:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->fileNameIndex:I

    iget v0, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->fileNameIndex:I

    iget v1, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->filesExistingAtOnce:I

    if-lt v0, v1, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->fileNameIndex:I

    :cond_0
    return-void
.end method

.method finalise()V
    .locals 1

    iget-object v0, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->currentFileOut:Ljava/io/FileOutputStream;

    if-eqz v0, :cond_0

    const/16 v0, -0x5dc2

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->writeFooter(S)Z

    invoke-direct {p0}, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->closeFile()V

    :cond_0
    return-void
.end method

.method getPaddedIndex()Ljava/lang/String;
    .locals 5

    const-string v1, ""

    iget v0, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->filesExistingAtOnce:I

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    iget v0, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->fileNameIndex:I

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v0

    :goto_0
    if-ge v0, v2, :cond_0

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v4, "0"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method off()Z
    .locals 1

    const/16 v0, -0x5dc1

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->writeFooter(S)Z

    move-result v0

    invoke-virtual {p0}, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->advanceFileNameIndex()V

    invoke-direct {p0}, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->closeFile()V

    return v0
.end method

.method on()Z
    .locals 1

    invoke-virtual {p0}, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->openFile()Z

    move-result v0

    return v0
.end method

.method openFile()Z
    .locals 3

    const/4 v0, 0x1

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v2, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->directoryName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "file.separator"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->fileNamePrefix:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->getPaddedIndex()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->fileNameSuffix:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->currentFile:Ljava/io/File;

    iget-object v1, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->currentFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->currentFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    :cond_0
    const-wide/16 v1, 0x0

    :try_start_0
    iput-wide v1, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->bytesWritten:J

    new-instance v1, Ljava/io/FileOutputStream;

    iget-object v2, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->currentFile:Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    iput-object v1, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->currentFileOut:Ljava/io/FileOutputStream;

    invoke-virtual {p0}, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->writeHeader()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return v0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method throwableStackTrace(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    invoke-virtual {p1, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method writeFooter(S)Z
    .locals 3

    const/4 v0, 0x1

    :try_start_0
    iget-object v1, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->currentFileOut:Ljava/io/FileOutputStream;

    invoke-virtual {p0, p1}, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->getFooter(S)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/FileOutputStream;->write([B)V

    iget-object v1, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->currentFileOut:Ljava/io/FileOutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return v0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method writeHeader()Z
    .locals 6

    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->getHeader()[B

    move-result-object v1

    :try_start_0
    iget-object v2, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->currentFileOut:Ljava/io/FileOutputStream;

    invoke-virtual {v2, v1}, Ljava/io/FileOutputStream;->write([B)V

    iget-object v2, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->currentFileOut:Ljava/io/FileOutputStream;

    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V

    iget-wide v2, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->bytesWritten:J

    array-length v1, v1

    int-to-long v4, v1

    add-long v1, v2, v4

    iput-wide v1, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->bytesWritten:J
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return v0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method writeRecord([B)Z
    .locals 5

    const/4 v0, 0x1

    iget-wide v1, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->maxFileSizeBeforeWrap:J

    const-wide/16 v3, -0x1

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    array-length v1, p1

    int-to-long v1, v1

    iget-wide v3, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->bytesWritten:J

    add-long/2addr v1, v3

    iget-object v3, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->footer:[B

    array-length v3, v3

    int-to-long v3, v3

    add-long/2addr v1, v3

    iget-wide v3, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->maxFileSizeBeforeWrap:J

    cmp-long v1, v1, v3

    if-lez v1, :cond_0

    const/16 v0, -0x5dc0

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->writeFooter(S)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->advanceFileNameIndex()V

    invoke-virtual {p0}, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->openFile()Z

    move-result v0

    :cond_0
    if-eqz v0, :cond_1

    :try_start_0
    iget-object v1, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->currentFileOut:Ljava/io/FileOutputStream;

    invoke-virtual {v1, p1}, Ljava/io/FileOutputStream;->write([B)V

    iget-wide v1, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->bytesWritten:J

    array-length v3, p1

    int-to-long v3, v3

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->bytesWritten:J

    iget-object v1, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinaryFile;->currentFileOut:Ljava/io/FileOutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    :goto_0
    return v0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    goto :goto_0
.end method
